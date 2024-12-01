<?php
session_start();
include('config/conn.php');

if (!isset($_SESSION['user_id'])) {
    echo 'not_logged_in';
    exit();
}

$userId = $_SESSION['user_id'];
$tourismId = $_POST['tourism_id'];
$action = $_POST['action'];

if ($action === 'save') {
    // Simpan data ke wishlist
    $query = "INSERT INTO wishlist (user_id, tourism_id) VALUES ($1, $2)";
    $result = pg_query_params($con, $query, array($userId, $tourismId));
    if ($result) {
        echo 'saved';
    } else {
        echo 'error';
    }
} elseif ($action === 'unsave') {
    $query = "DELETE FROM wishlist WHERE user_id = $1 AND tourism_id = $2";
    $result = pg_query_params($con, $query, array($userId, $tourismId));
    if ($result) {
        echo 'unsaved';
    } else {
        echo 'error';
    }
}
