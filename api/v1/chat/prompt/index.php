<?php
include $_SERVER['DOCUMENT_ROOT'] . '/api/config.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/db.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/utils.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if ($_SERVER['REMOTE_ADDR'] !== ADMIN_API)
        responseJson("error", "Access denied on this server");

    //responseJson("error", "Error sending message");

    $id = $_POST['id'];
    $msg = $_POST['msg'];

    $db = openCon();

    $stmt = $db->prepare('INSERT INTO chat_history (hid, human) VALUES (?, ?)');
    $stmt->bind_param('ss', $id, $msg);
    $stmt->execute();

    $data = [
        "id" => $db->insert_id
    ];

    responseJson("ok", "", $data);

    closeCon($db);
}