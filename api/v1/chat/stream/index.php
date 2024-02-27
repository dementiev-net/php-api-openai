<?php
include $_SERVER['DOCUMENT_ROOT'] . '/api/config.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/db.php';
include $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

use Orhanerday\OpenAi\OpenAi;

$openAi = new OpenAi(OPENAI_API_KEY);
$openAi->setBaseURL(OPENAI_API_URL);

$db = openCon();

$hid = $_GET['hid'];
$id = $_GET['id'];

$results = $db->query('SELECT * FROM chat_history ORDER BY id ASC;');
//$historyArray[] = ["role" => "system", "content" => "Ты полезный помощник."];
while ($row = $results->fetch_assoc()) {
    if ($row['human']) $historyArray[] = ["role" => "user", "content" => $row['human']];
    if ($row['ai']) $historyArray[] = ["role" => "assistant", "content" => $row['ai']];
}

$stmt = $db->prepare('SELECT human FROM chat_history WHERE id = ?;');
$stmt->bind_param('i', $hid);
$stmt->execute();
$result = $stmt->get_result();
$msg = $result->fetch_assoc()['human'];

if ($msg) $historyArray[] = ["role" => "user", "content" => $msg];

$opts = [
    'model' => OPENAI_MODEL,
    'messages' => $historyArray,
    'temperature' => 1.0,
    'max_tokens' => OPENAI_MAX_TOKENS,
    'frequency_penalty' => 0,
    'presence_penalty' => 0,
    'stream' => true
];

header('Content-type: text/event-stream');
header('Cache-Control: no-cache');

$txt = "";
$complete = $openAi->chat($opts, function ($curl_info, $data) use (&$txt) {
    if ($obj = json_decode($data) and $obj->error->message != "") {
        error_log(json_encode($obj->error->message));
    } else {
        echo $data;
        $results = explode('data: ', $data);
        foreach ($results as $result) {
            if ($result != '[DONE]') {
                $arr = json_decode($result, true);
                if (isset($arr["choices"][0]["delta"]["content"])) {
                    $txt .= $arr["choices"][0]["delta"]["content"];
                }
            }
        }
    }
    echo PHP_EOL;
    if (ob_get_level() > 0) {
        @ob_flush();
    }
    flush();
    return strlen($data);
});

$stmt = $db->prepare('UPDATE chat_history SET ai = ? WHERE id = ?;');
$stmt->bind_param('ss', $txt, $hid);
$stmt->execute();

$db->close();