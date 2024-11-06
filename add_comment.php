<?php
include('config/conn.php');
header('Content-Type: application/json');

// Mendapatkan data JSON dari request
$data = json_decode(file_get_contents('php://input'), true);
$postId = $data['postId'];
$userId = 1; // Gantilah dengan ID user yang sedang login
$commentText = $data['commentText'];

// Validasi input
if (!empty($commentText)) {
    $query = "INSERT INTO post_comments (post_id, user_id, comment_text, created_at) VALUES (?, ?, ?, NOW())";
    $stmt = $con->prepare($query);
    $stmt->bind_param("iis", $postId, $userId, $commentText);
    
    if ($stmt->execute()) {
        echo json_encode(["message" => "Comment added successfully."]);
    } else {
        echo json_encode(["message" => "Error adding comment."]);
    }
} else {
    echo json_encode(["message" => "Comment text cannot be empty."]);
}
?>
