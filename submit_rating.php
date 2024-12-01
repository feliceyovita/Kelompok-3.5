<?php
session_start();
include('config/conn.php');

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$userId = $_SESSION['user_id'];
$tourismId = $_POST['tourism_id'];
$ratingValue = $_POST['rating'];

// Validate input
if (empty($tourismId) || empty($ratingValue) || $ratingValue < 1 || $ratingValue > 5) {
    echo 'invalid_input';
    exit();
}

// Insert or update rating in the database
$sql = "
    INSERT INTO ratings (user_id, tourism_id, rating_value, time)
    VALUES ($1, $2, $3, NOW())
    ON CONFLICT (user_id, tourism_id)
    DO UPDATE SET rating_value = $3, time = NOW()
";
$result = pg_query_params($con, $sql, [$userId, $tourismId, $ratingValue]);

if ($result) {
    echo 'success';
} else {
    echo 'error: ' . pg_last_error($con);
    exit();
}

// Calculate the average rating
$query = "SELECT AVG(rating_value) AS average_rating FROM ratings WHERE tourism_id = $1";
$result = pg_query_params($con, $query, [$tourismId]);

if ($result) {
    $row = pg_fetch_assoc($result);
    $averageRating = round($row['average_rating'], 1);
    // Return the new average as response
    echo $averageRating;
} else {
    echo 'error: ' . pg_last_error($con);
    exit();
}
