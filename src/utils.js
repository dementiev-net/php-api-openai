export function get(selector, root = document) {
    return root.querySelector(selector)
}

export function formatDate(date) {
    const h = "0" + date.getHours()
    const m = "0" + date.getMinutes()

    return `${h.slice(-2)}:${m.slice(-2)}`
}

export function random(min, max) {
    return Math.floor(Math.random() * (max - min) + min)
}

export function uuidv4() {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c =>
        (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    )
}

export function showError(message) {
    get('#alert').innerHTML = `
    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="alert">
        ${message}
        <button type="button" class="close" data-dismiss="alert" aria-label="Закрыть">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>`
    console.error(message)
}

export function appendMessage(name, who, txt, id) {
    txt = txt.replace(/(?:\r\n|\r|\n)/g, '<br>')
    const msgAi = `
    <div class="pt-3">
        <h5><img src="./assets/chatgpt.svg" width="18" height="18" class="mb-1"> ${name}</h5>
        <div>
            <p id=${id}>${txt}</p>
            <!--<a href="#" class="btn btn-link pl-0 ml-0">Скопировать</a>-->
        </div>
    </div>`
    const msgYou = `
    <div>
        <div class="pl-3" style="border-left: 4px solid #007bff !important;">${txt}</div>
    </div>`
    get("#msger-chat").insertAdjacentHTML("beforeend", who === 'you' ? msgYou : msgAi)
    window.scrollTo({
        top: document.body.scrollHeight,
        behavior: "smooth",
    })
}