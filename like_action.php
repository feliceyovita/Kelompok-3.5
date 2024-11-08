<?php
session_start();
include('config/conn.php');

if (isset($_POST['post_id']) && isset($_SESSION['user_id'])) {
    $post_id = $_POST['post_id'];
    $user_id = $_SESSION['user_id'];

    // Mengecek apakah pengguna sudah memberikan like pada postingan
    $check_like = "SELECT * FROM likes WHERE post_id = '$post_id' AND user_id = '$user_id'";
    $result = mysqli_query($con, $check_like);

    if (mysqli_num_rows($result) > 0) {
        // Jika sudah like, hapus like
        $query = "DELETE FROM likes WHERE post_id = '$post_id' AND user_id = '$user_id'";
        $response = 'unliked';
    } else {
        // Jika belum like, tambahkan like
        $query = "INSERT INTO likes (post_id, user_id, is_liked) VALUES ('$post_id', '$user_id', TRUE)";
        $response = 'liked';
    }

    if (mysqli_query($con, $query)) {
        echo $response;
    } else {
        echo 'error';
    }
}
?>
