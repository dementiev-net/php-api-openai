<?php
include $_SERVER['DOCUMENT_ROOT'] . '/api/config.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/db.php';
include $_SERVER['DOCUMENT_ROOT'] . '/api/utils.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    //responseJson("error", "Error getting chat history");

    $db = openCon();

    $chatId = $_POST['id'];

    $stmt = $db->prepare('SELECT id, human, ai FROM chat_history WHERE hid = ? ORDER BY id ASC;');
    $stmt->bind_param('s', $chatId);
    $stmt->execute();
    $result = $stmt->get_result();

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    closeCon($db);

    responseJson("ok", "", $data);
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {

    $db = openCon();

    $chatId = $_GET['id'];

    $stmt = $db->prepare('DELETE FROM chat_history WHERE hid = ?;');
    $stmt->bind_param('s', $chatId);
    $stmt->execute();

    closeCon($db);

    responseNoData();
}