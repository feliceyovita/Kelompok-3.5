<?php
include('config/conn.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];

$sql = "UPDATE users SET profile_picture = 'uploads/default_profile_picture.jpg' WHERE user_id = $1";
$result = pg_query_params($con, $sql, array($user_id));

if ($result && pg_affected_rows($result) > 0) {
    header('Location: profile.php?message=profile_picture_deleted');
} else {
    header('Location: profile.php?message=error_deleting_picture');
}
exit;
