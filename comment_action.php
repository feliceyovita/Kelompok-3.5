<?php
session_start();
include('config/conn.php');

if (isset($_POST['post_id'], $_POST['comment'], $_SESSION['user_id'])) {
    $post_id = $_POST['post_id'];
    $user_id = $_SESSION['user_id'];
    $comment = trim($_POST['comment']);

    if ($comment === '') {
        echo 'error: empty comment';
        exit;
    }

    // Escape input to prevent SQL Injection
    $comment = mysqli_real_escape_string($con, $comment);

    $query = "INSERT INTO comments (post_id, user_id, comment) VALUES ('$post_id', '$user_id', '$comment')";

    if (mysqli_query($con, $query)) {
        echo 'success';
    } else {
        echo 'error';
    }
} else {
    echo 'error: missing data';
}
?>
