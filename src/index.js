import markdownit from 'markdown-it'
import hljs from 'highlight.js'
import {get, uuidv4, showError, appendMessage} from './utils.js'
import {deleteAllCookies, getCookie} from './cookie.js'

if (getCookie("id") == "") {
    const uuid = uuidv4()
    document.cookie = "id=" + uuid
    get("#id").value = uuid
} else {
    get("#id").value = getCookie("id")
}

const BOT_NAME = "AI:"
const PERSON_NAME = "Вы"
const CHAT_ID = get("#id").value
const idSession = get("#id_session")
const msgerForm = get("#msger-form")
const msgerInput = get("#msger-text")
const modelInput = get("#msger-modelselect")
const presetInput = get("#msger-presetselect")
const deleteButton = get('#delete-button')
const deleteButtonCount = get('#delete-buttoncount')
const msgerSendBtn = get("#msger-send-btn")

const md = markdownit({
    highlight: function (str, lang) {
        if (lang && hljs.getLanguage(lang)) {
            try {
                return hljs.highlight(str, {language: lang}).value
            } catch (__) {
            }
        }
        return ''
    }
})

idSession.textContent = CHAT_ID
getModels()
getPresets()
getHistory(CHAT_ID, PERSON_NAME, BOT_NAME)

/**
 * Event listeners
 */
deleteButton.addEventListener('click', event => {
    event.preventDefault()
    deleteHistory(CHAT_ID)
    deleteButtonCount.innerHTML = "0"
})

msgerForm.addEventListener("submit", event => {
    event.preventDefault()
    const msgText = msgerInput.value
    if (!msgText) return
    appendMessage(PERSON_NAME, "you", msgText, 0)
    msgerInput.value = ""
    sendPrompt(CHAT_ID, BOT_NAME, msgText)
    deleteButtonCount.innerHTML = Number(deleteButtonCount.innerHTML) + 1
})

modelInput.addEventListener('change', event => {
    event.preventDefault()
})

presetInput.addEventListener('change', event => {
    event.preventDefault()
    msgerInput.value = event.target.value
})

/**
 * Functions
 */
function deleteHistory(userId) {
    if (!confirm("Вы уверены? Ваш сеанс и история будут удалены навсегда!")) {
        return false
    }
    fetch('/api/v1/history/?id=' + userId, {
        method: 'DELETE',
        headers: {'Content-Type': 'application/json'}
    })
        .then(response => {
            if (!response.ok) throw new Error('Error deleting chat history: ' + response.statusText)
            deleteAllCookies()
            location.reload()
        })
        .catch(error => showError("deleteHistory() - " + error))
}

function getHistory(userId, personName, botName) {
    const formData = new FormData()
    formData.append('id', userId)
    fetch('/api/v1/history/', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(json => {
            if (json.status === "error") throw new Error(json.message)
            for (const row of json.data) {
                appendMessage(personName, "you", row.human, 0)
                appendMessage(botName, "ai",  md.render(row.ai), row.id)
            }
            deleteButtonCount.innerHTML = json.data.length
        })
        .catch(error => showError("getHistory() - " + error))
}

function getPresets() {
    fetch('/api/v1/presets/', {
        method: 'GET'
    })
        .then(response => response.json())
        .then(json => {
            if (json.status === "error") throw new Error(json.message)
            for (const row of json.data) {
                presetInput.add(new Option(row.name, row.preset))
            }
        })
        .catch(error => showError("getPresets() - " + error))
}

function getModels() {
    fetch('/api/v1/models/', {
        method: 'GET'
    })
        .then(response => response.json())
        .then(json => {
            if (json.status === "error") throw new Error(json.message)
            for (const row of json.data) {
                modelInput.add(new Option(row.model, row.code))
            }
        })
        .catch(error => showError("getModels() - " + error))
}

function sendPrompt(userId, botName, msg) {
    msgerSendBtn.disabled = true
    const formData = new FormData();
    formData.append('msg', msg)
    formData.append('id', userId)
    fetch('/api/v1/chat/prompt/', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(json => {
            if (json.status === "error") throw new Error(json.message)
            let uuid = uuidv4()
            const eventSource = new EventSource(`/api/v1/chat/stream/?hid=${json.data.id}&id=${encodeURIComponent(userId)}`)
            appendMessage(botName, "ai", "", uuid)
            const div = document.getElementById(uuid)
            eventSource.onmessage = function (e) {
                if (e.data === "[DONE]") {
                    msgerSendBtn.disabled = false
                    div.innerHTML = md.render(div.innerHTML.replace(/<br ?\/?>/g, '\n'))
                    window.scrollTo({
                        top: document.body.scrollHeight,
                        behavior: "smooth",
                    })
                    eventSource.close()
                } else {
                    let txt = JSON.parse(e.data).choices[0].delta.content
                    if (txt !== undefined) {
                        div.innerHTML += txt.replace(/(?:\r\n|\r|\n)/g, '<br>')
                    }
                }
            }
            eventSource.onerror = function (e) {
                msgerSendBtn.disabled = false
                console.log(e)
                eventSource.close()
            }
        })
        .catch(error => showError("sendPrompt() - " + error))
}