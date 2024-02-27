<?php
include $_SERVER['DOCUMENT_ROOT'] . '/api/config.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/db.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/utils.php';
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
    'presence_penalty' => 0
];

$complete = $openAi->chat($opts);
$json = json_decode($complete);
$txt = $json->choices[0]->message->content;
$prompt_tokens = $json->usage->prompt_tokens;
$completion_tokens = $json->usage->completion_tokens;
$total_tokens = $json->usage->total_tokens;

$data = [
    "text" => $txt,
    "usage" => [
        "prompt_tokens" => $prompt_tokens,
        "completion_tokens" => $completion_tokens,
        "total_tokens" => $total_tokens
    ]
];

$stmt = $db->prepare('UPDATE chat_history SET ai = ?, prompt_tokens = ?, completion_tokens = ?, total_tokens = ? WHERE id = ?;');
$stmt->bind_param('siiis', $txt, $prompt_tokens, $completion_tokens, $total_tokens, $hid);
$stmt->execute();

responseJson("ok", "", $data);

$db->close();