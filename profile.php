<?php
session_start();
include('config/conn.php');

// Choose account for profile page
if (isset($_GET['user_id'])) {
    $user_id = (int)$_GET['user_id'];
} elseif (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    header('Location: login.php');
    exit;
}


$profilePicture = 'uploads/default_profile_picture.jpg';

// Profile Picture
if (isset($_SESSION['user_id'])) {
    $sql = "SELECT profile_picture FROM users WHERE user_id = $1";
    $result = pg_query_params($con, $sql, [$user_id]);
    if ($result && pg_num_rows($result) > 0) {
        $user = pg_fetch_assoc($result);
        $profilePicture = $user['profile_picture'];
    }
}

// Fetch user data
$sql_user = "
    SELECT users.username,
           (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.user_id) AS post_count,
           (SELECT COUNT(*) FROM post_likes WHERE post_likes.user_id = users.user_id) AS like_count
    FROM users
    WHERE users.user_id = $1";
$result_user = pg_query_params($con, $sql_user, [$user_id]);

if ($result_user && pg_num_rows($result_user) > 0) {
    $row = pg_fetch_assoc($result_user);
    $username = $row['username'];
    $post_count = $row['post_count'];
    $like_count = $row['like_count'];
} else {
    $username = 'Guest';
    $post_count = 0;
    $like_count = 0;
}

// Query for Likes
$sql_likes = "
    SELECT p.id, p.user_id, p.content, p.image, p.created_at, u.username, u.profile_picture,
           CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END AS is_liked,
           (SELECT COUNT(*) FROM post_likes WHERE post_id = p.id) AS like_count,
           (SELECT COUNT(*) FROM post_comments WHERE post_id = p.id) AS comment_count
    FROM posts p
    JOIN users u ON p.user_id = u.user_id
    LEFT JOIN post_likes l ON l.post_id = p.id AND l.user_id = $1
    WHERE EXISTS (
        SELECT 1 
        FROM post_likes 
        WHERE post_likes.post_id = p.id AND post_likes.user_id = $1
    )
    GROUP BY p.id, u.username, u.profile_picture, l.id
    ORDER BY p.created_at DESC";
$likes_result = pg_query_params($con, $sql_likes, [$_SESSION['user_id']]);

// Query for Posts
$sql_posts = "
    SELECT p.id, p.user_id, p.content, p.image, p.created_at, u.username, u.profile_picture,
           CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END AS is_liked,
           (SELECT COUNT(*) FROM post_likes WHERE post_id = p.id) AS like_count,
           (SELECT COUNT(*) FROM post_comments WHERE post_id = p.id) AS comment_count
    FROM posts p
    JOIN users u ON p.user_id = u.user_id
    LEFT JOIN post_likes l ON l.post_id = p.id AND l.user_id = $1
    WHERE p.user_id = $2
    GROUP BY p.id, u.username, u.profile_picture, l.id
    ORDER BY p.created_at DESC";
$posts_result = pg_query_params($con, $sql_posts, [$_SESSION['user_id'], $user_id]);

// Fetch Comments
function getComments($post_id, $con)
{
    $query = "
        SELECT c.comment_text, c.created_at, u.username, u.profile_picture 
        FROM post_comments c
        JOIN users u ON c.user_id = u.user_id
        WHERE c.post_id = $1
        ORDER BY c.created_at DESC";
    $result = pg_query_params($con, $query, [$post_id]);
    $comments = [];
    while ($row = pg_fetch_assoc($result)) {
        $row['profile_picture'] = !empty($row['profile_picture']) ? $row['profile_picture'] : 'uploads/default_profile_picture.jpg';
        $comments[] = $row;
    }
    return $comments;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />

    <!-- Custom CSS File -->
    <link href="css/profile.css" rel="stylesheet">
    <link href="css/community.css" rel="stylesheet">

    <!-- Google Fonts for Material Icons -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

    <title>WikiTrip Community</title>
</head>

<body>
    <?php include 'navbar.php'; ?>

    <div class="profile-header">
        <div class="profile-info">
            <div class="profile-picture-container">
                <img alt="Profile Picture" src="<?= htmlspecialchars($profilePicture); ?>" width="80" class="profile-picture" />
                <a href="#" class="edit-icon" onclick="toggleModal('uploadModal'); return false;">
                    <i class="fas fa-pencil-alt"></i>
                </a>
                <a href="delete_picture.php?user_id=<?= htmlspecialchars($user_id); ?>" class="delete-icon" onclick="return confirm('Are you sure you want to delete your profile picture?');">
                    <i class="fas fa-trash-alt"></i>
                </a>
            </div>
            <div id="uploadModal" class="modal" style="display: none;">
                <div class="modal-content">
                    <span class="close" onclick="document.getElementById('uploadModal').style.display='none';">&times;</span>
                    <h2>Change Profile Picture</h2>
                    <form action="submit_profile.php" method="POST" enctype="multipart/form-data">
                        <input type="file" name="profile_picture" id="profile_picture" accept="" required>
                        <button type="submit">Upload</button>
                    </form>
                </div>
            </div>
            <div class="profile-details">
                <h2><?= htmlspecialchars($username); ?></h2>
                <div class="profile-stats">
                    <div>
                        <p>Activities</p>
                        <span><?= $post_count ?> Posts <?= $like_count ?> Likes</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="profile-nav">
            <a href="#" id="show-posts">Posts</a>
            <a href="#" id="show-likes">Likes</a>
        </div>
    </div>

    <div id="activities" class="content" style="display: none;">
        <div class="section">
            <i class="bi bi-file-earmark-text">
                <p>Posts</p>
            </i>
            <h3 class="divider"></h3>
            <div class="activity">
                <?php if (pg_num_rows($posts_result) > 0): ?>
                    <?php $result = $posts_result; ?>
                    <?php
                    $source_page = 'profile';
                    include 'post.php';
                    ?>
                <?php else: ?>
                    <p>No posts found.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div id="reviews" class="content">
        <div class="section">
            <i class="bi bi-file-earmark-text">
                <p>Likes</p>
            </i>
            <h3 class="divider"></h3>
            <div class="activity">
                <?php if (pg_num_rows($likes_result) > 0): ?>
                    <?php $result = $likes_result; ?>
                    <?php
                    $source_page = 'profile';
                    include 'post.php';
                    ?>
                <?php else: ?>
                    <p>No likes found.</p>
                <?php endif; ?>
            </div>

        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/profile.js"></script>
    <script src="js/post_action.js"></script>
</body>

</html>