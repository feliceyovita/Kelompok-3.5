<?php
session_start();
include 'config/conn.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];
$content = $_POST['content'];
$image = NULL;

// Handle file upload if an image is provided
if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
    $target_dir = "uploads/";
    $image = basename($_FILES["image"]["name"]);

    // Ensure the uploaded file is safe
    $target_file = $target_dir . $image;
    $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
    $file_extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if (in_array($file_extension, $allowed_types)) {
        move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    } else {
        die("Invalid file type. Only JPG, JPEG, PNG, and GIF are allowed.");
    }
}

// Insert the post into the database
$query = "INSERT INTO posts (user_id, content, image) VALUES ($1, $2, $3)";
$result = pg_query_params($con, $query, [$user_id, $content, $image]);

if ($result) {
    header("Location: community.php");
    exit();
} else {
    die("Error inserting post: " . pg_last_error($con));
}
