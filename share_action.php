<?php
session_start();
include('config/conn.php');

if (isset($_SESSION['user_id']) && isset($_POST['post_id'])) {
    $user_id = $_SESSION['user_id'];
    $post_id = intval($_POST['post_id']);

    // Insert share data into post_shares table
    $query = "INSERT INTO shares (post_id, user_id) VALUES (?, ?)";
    $stmt = $con->prepare($query);
    $stmt->bind_param("ii", $post_id, $user_id);

    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Post shared successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to share the post.']);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Unauthorized request.']);
}
?>
