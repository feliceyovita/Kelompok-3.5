<?php
session_start();
include('config/conn.php');

if (isset($_POST['post_id']) && isset($_SESSION['user_id'])) {
    $post_id = $_POST['post_id'];
    $user_id = $_SESSION['user_id'];

    // Cek apakah user sudah menyukai postingan
    $checkLikeQuery = "SELECT id FROM post_likes WHERE post_id = '$post_id' AND user_id = '$user_id'";
    $result = mysqli_query($con, $checkLikeQuery);

    if (mysqli_num_rows($result) > 0) {
        // Jika sudah ada, hapus like
        $deleteQuery = "DELETE FROM post_likes WHERE post_id = '$post_id' AND user_id = '$user_id'";
        mysqli_query($con, $deleteQuery);
    } else {
        // Jika belum ada, tambahkan like
        $insertQuery = "INSERT INTO post_likes (post_id, user_id) VALUES ('$post_id', '$user_id')";
        mysqli_query($con, $insertQuery);
    }

    // Kembalikan jumlah like yang baru
    $countQuery = "SELECT COUNT(id) AS total_likes FROM post_likes WHERE post_id = '$post_id'";
    $countResult = mysqli_query($con, $countQuery);
    $count = mysqli_fetch_assoc($countResult)['total_likes'];

    echo $count;
}
?>
