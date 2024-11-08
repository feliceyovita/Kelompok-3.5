<?php
session_start();
include('config/conn.php');

if (isset($_POST['post_id']) && isset($_POST['content']) && isset($_SESSION['user_id'])) {
    $post_id = $_POST['post_id'];
    $content = mysqli_real_escape_string($con, $_POST['content']);
    $user_id = $_SESSION['user_id'];

    $insertQuery = "INSERT INTO post_comments (post_id, user_id, content) VALUES ('$post_id', '$user_id', '$content')";
    mysqli_query($con, $insertQuery);

    echo 'success';
}
?>
