<?php
include $_SERVER['DOCUMENT_ROOT'] . '/api/config.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/db.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/utils.php';

//responseJson("error", "Error getting models");

$db = openCon();

$stmt = $db->prepare('SELECT * FROM chat_models ORDER BY id ASC;');
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

closeCon($db);

responseJson("ok", "", $data);