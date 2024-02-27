<?php
function responseJson($status, $message, $data = [])
{
    $returnArray = [
        "status" => $status,
        "message" => $message,
        "data" => $data,
    ];

    header('Content-Type: application/json');

    echo json_encode($returnArray);
    die;
}

function responseNoData()
{
    http_response_code(204);
    die;
}