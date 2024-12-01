<?php
session_start();
include('config/conn.php');
$source_page = isset($_GET['source_page']) ? $_GET['source_page'] : null;

if (!isset($_GET['post_id']) || !is_numeric($_GET['post_id'])) {
    die('Invalid post_id.');
}

if (!isset($_SESSION['user_id'])) {
    die('Session user_id is missing.');
}

$post_id = (int)$_GET['post_id'];
$user_id = $_SESSION['user_id'];

// Delete post query
$sql = "DELETE FROM posts WHERE id = $1 AND user_id = $2";
$result = pg_query_params($con, $sql, [$post_id, $user_id]);

if ($result && pg_affected_rows($result) > 0) {
    if ($source_page === 'profile') {
        header('Location: profile.php');
    } elseif ($source_page === 'community') {
        header('Location: community.php');
    } else {
        header('Location: index.php');
    }
} else {
    echo "Error: Unable to delete the post.";
}
exit;
