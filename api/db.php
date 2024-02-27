<?php
function openCon()
{
    $conn = new mysqli(
        DB_HOST,
        DB_USER,
        DB_PASS,
        DB_NAME)
    or die("Connect failed: %s\n" . $conn->error);
    return $conn;
}

function closeCon($conn)
{
    $conn->close();
}