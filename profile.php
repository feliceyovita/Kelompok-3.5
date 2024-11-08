<?php
session_start();
include('config/conn.php');
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];
$sql = "
    SELECT users.username,
           (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.user_id) AS post_count,
           (SELECT COUNT(*) FROM post_likes WHERE post_likes.user_id = users.user_id) AS like_count
    FROM users
    WHERE users.user_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $username = $row['username'];
    $post_count = $row['post_count'];
    $like_count = $row['like_count'];
} else {

    $username = $row['username'];
    $post_count = 0;
    $like_count = 0;
}

$show_likes = isset($_GET['section']) && $_GET['section'] == 'likes';
if ($show_likes) {
    $sql = "
        SELECT posts.id, posts.content, posts.created_at, posts.image, users.username,
               (SELECT COUNT(*) FROM post_likes WHERE post_likes.post_id = posts.id AND post_likes.user_id = ?) AS is_liked
        FROM posts
        JOIN users ON posts.user_id = users.user_id
        JOIN post_likes ON post_likes.post_id = posts.id
        WHERE post_likes.user_id = ?
        ORDER BY posts.created_at DESC";
} else {
    $sql = "
        SELECT posts.id, posts.content, posts.created_at, posts.image, users.username,
               (SELECT COUNT(*) FROM post_likes WHERE post_likes.post_id = posts.id AND post_likes.user_id = ?) AS is_liked
        FROM posts
        JOIN users ON posts.user_id = users.user_id
        WHERE posts.user_id = ?
        ORDER BY posts.created_at DESC";
}

$stmt = $con->prepare($sql);
$stmt->bind_param("ii", $user_id, $user_id);
$stmt->execute();
$result = $stmt->get_result();


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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>

    <!-- Custom CSS File -->
    <link href="css/profile.css" rel="stylesheet">
    <link href="css/community.css" rel="stylesheet">

    <!-- Google Fonts for Material Icons -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

    <title>WikiTrip Community</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="main-nav" style="background-color: #0a598f;">
        <div class="container">
            <a class="navbar-brand logo fw-bold fs-4 d-flex align-items-center" href="#page-top">
                <img src="image/logo_wikitrip.png" alt="Logo" class="logo-img me-2">
                <span class="text-logo1">WIKI</span><span class="text-logo2">TRIP</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#about">About</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Destination
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="index.php#nature-destination">Nature destinations</a></li>
                            <li><a class="dropdown-item" href="index.php#cultural-destination">Cultural destinations</a></li>
                            <li><a class="dropdown-item" href="index.php#culinary-destination">Culinary destinations</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="index.php#Event">Event</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="community.php">Community</a>
                    </li>
                </ul>
                <div>
                    <ul>
                        <li class="nav-item profile-dropdown">
                            <div class="bi bi-person-circle text-white fs-4 me-2"></div>
                            <ul>
                                <li class="sub-item">
                                    <i class="bi bi-person-circle material-icons-outlined"></i>
                                    <p>Profile</p>
                                </li>
                                <li class="sub-item">
                                    <a href="bookmark.php" class="bookmark-link" style="text-decoration: none; display: flex; align-items: center;">
                                        <i class="bi bi-bookmark material-icons-outlined"></i>
                                        <p style="margin-left: 8px;">Bookmark</p>
                                    </a>
                                </li>
                                <li class="sub-item">
                                    <?php if (isset($_SESSION['user_id'])): ?>
                                        <a href="logout.php" style="text-decoration: none; display: flex; align-items: center;">
                                            <i class="bi bi-box-arrow-left material-icons-outlined"></i>
                                            <p style="margin-left: 8px;">Logout</p>
                                        </a>
                                    <?php else: ?>
                                        <a href="login.php" style="text-decoration: none; display: flex; align-items: center;">
                                            <i class="bi bi-box-arrow-left material-icons-outlined"></i>
                                            <p style="margin-left: 8px;">Login</p>
                                        </a>
                                    <?php endif; ?>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="profile-header">
        <div class="profile-info">
            <div class="profile-picture-container">
                <img alt="Profile Picture" src="https://storage.googleapis.com/a1aa/image/EscWC3kegGUHcy1u0CoVVXhILlQuyPP8EvNeAepZrrM00mcnA.jpg" width="80" class="profile-picture"/>
                <a href="#" class="edit-icon">
                    <i class="fas fa-pencil-alt"></i>
                </a>
            </div>
            <div class="profile-details">
                <h2><?= htmlspecialchars($username); ?></h2>
                <div class="profile-stats">
                    <div>
                        <p>Activities</p>
                        <span><?= $post_count ?> Posts  <?= $like_count ?> Likes</span>
                    </div>
                </div>
            </div>
        </div>        
        <div class="profile-nav">
            <a href="#" onclick="showSection('activities')">Posts</a>
            <a href="#" class="active" onclick="showSection('reviews')">Likes</a>
        </div>
    </div>
    
    <div class="content">
        <div id="activities" class="section" style="display: none;">
            <h3 class="divider">
                <i class="bi bi-file-earmark-text "></i> Posts
            </h3>
            <div class="activity">
                <?php if ($result->num_rows > 0): ?>
                <div class="posts-container" >
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <div class="post-box" data-post-id="<?= $row['id']; ?>">
                            <div class="post-options">
                                <i class="fas fa-ellipsis-v options-icon"></i>
                                <div class="options-dropdown">
                                    <i class="fas fa-trash"></i>
                                    <span>Delete Post</span>
                                </div>
                            </div>
                            <div class="post-header">
                                <img src="https://storage.googleapis.com/a1aa/image/VsypAsQ3mTahONwjGX6dJASjPLkEBJy1y98zMf69JcOm92zJA.jpg" alt="User Profile Picture" height="40" width="40">
                                <div>
                                    <div class="post-author-name"><?= htmlspecialchars($row['username']); ?></div>
                                    <div class="post-time"><?= date('d M Y H:i', strtotime($row['created_at'])); ?></div>
                                </div>
                            </div>
                            <div class="post-content">
                                <p><?= nl2br(htmlspecialchars($row['content'])); ?></p>
                                <?php if ($row['image']): ?>
                                    <img src="uploads/<?= htmlspecialchars($row['image']); ?>" alt="Post Image" style="max-width:100%; height:auto;">
                                <?php endif; ?>
                            </div>
                            <div class="post-actions">
                                <div class="like-button <?= $row['is_liked'] ? 'liked' : ''; ?>"><i class="fas fa-thumbs-up"></i> Like</div>
                                <div><i class="fas fa-comment"></i> Comment</div>
                                <div class="share-button"><i class="fas fa-share"></i> Share</div>
                            </div>
                            <div class="comment-section" style="display: none;">
                                <input type="text" class="comment-input" placeholder="Tulis komentar...">
                                <button class="comment-submit">Kirim</button>
                                <div class="comment-list"></div>
                            </div>
                            <div class="share-popup" style="display: none;">
                                <div class="share-options">
                                    <i class="fab fa-facebook"></i> Facebook
                                    <i class="fab fa-whatsapp"></i> WhatsApp
                                    <i class="fab fa-instagram"></i> Instagram
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
            <?php else: ?>
                <p>No posts found.</p>
            <?php endif; ?>
            </div>
        </div>
    
        <div id="reviews" class="section" style="display: block;">
            <h3 class="divider">
                <i class="bi bi-hand-thumbs-up"></i> Likes
            </h3>
            <div class="activity">
                <?php if ($result->num_rows > 0): ?>
                    <div class="posts-container">
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <div class="post-box" data-post-id="<?= $row['id']; ?>">
                                <div class="post-options">
                                    <i class="fas fa-ellipsis-v options-icon"></i>
                                    <div class="options-dropdown">
                                        <i class="fas fa-trash"></i>
                                        <span>Delete Post</span>
                                    </div>
                                </div>
                                <div class="post-header">
                                    <img src="https://storage.googleapis.com/a1aa/image/VsypAsQ3mTahONwjGX6dJASjPLkEBJy1y98zMf69JcOm92zJA.jpg" alt="User Profile Picture" height="40" width="40">
                                    <div>
                                        <div class="post-author-name"><?= htmlspecialchars($row['username']); ?></div>
                                        <div class="post-time"><?= date('d M Y H:i', strtotime($row['created_at'])); ?></div>
                                    </div>
                                </div>
                                <div class="post-content">
                                    <p><?= nl2br(htmlspecialchars($row['content'])); ?></p>
                                    <?php if ($row['image']): ?>
                                        <img src="uploads/<?= htmlspecialchars($row['image']); ?>" alt="Post Image" style="max-width:100%; height:auto;">
                                    <?php endif; ?>
                                </div>
                                <div class="post-actions">
                                    <div class="like-button <?= $row['is_liked'] ? 'liked' : ''; ?>"><i class="fas fa-thumbs-up"></i> Like</div>
                                    <div><i class="fas fa-comment"></i> Comment</div>
                                    <div class="share-button"><i class="fas fa-share"></i> Share</div>
                                </div>
                            </div>
                        <?php endwhile; ?>
                    </div>
                <?php else: ?>
                    <p>No likes found.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/profile.js"></script>
    <script src="js/post_action_community.js"></script>
</body>
</html>
