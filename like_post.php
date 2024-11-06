<?php
session_start();
include('config/conn.php');
header('Content-Type: application/json');

// Mendapatkan data JSON dari request
$data = json_decode(file_get_contents('php://input'), true);
$postId = $data['postId'];
$userId = $_SESSION['user_id'];
$isLiked = $data['like'];

if ($isLiked) {
    // Menyimpan like ke database
    $query = "INSERT INTO post_likes (post_id, user_id) VALUES (?, ?)";
    $stmt = $con->prepare($query);
    $stmt->bind_param("ii", $postId, $userId);
    if ($stmt->execute()) {
        echo json_encode(["message" => "Post liked successfully."]);
    } else {
        echo json_encode(["message" => "Error liking post."]);
    }
} else {
    // Menghapus like dari database
    $query = "DELETE FROM post_likes WHERE post_id = ? AND user_id = ?";
    $stmt = $con->prepare($query);
    $stmt->bind_param("ii", $postId, $userId);
    if ($stmt->execute()) {
        echo json_encode(["message" => "Post unliked successfully."]);
    } else {
        echo json_encode(["message" => "Error unliking post."]);
    }
}
?>
