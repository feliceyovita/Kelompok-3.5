<?php
session_start();
include('config/conn.php');

$isLoggedIn = isset($_SESSION['user_id']);

$keyword = isset($_GET['keyword']) ? mysqli_real_escape_string($con, $_GET['keyword']) : '';

// Jika ada keyword, lakukan pencarian
if ($keyword != '') {
    $query = "SELECT p.id, p.user_id, p.content, p.image, p.created_at, u.username,
              (CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END) AS is_liked
              FROM posts p
              JOIN users u ON p.user_id = u.user_id
              LEFT JOIN post_likes l ON l.post_id = p.id AND l.user_id = p.user_id
              WHERE p.content LIKE '%$keyword%'
              ORDER BY p.created_at DESC";
    echo "<h6>Result search for : '$keyword'</h6>";
} else {
    // Jika tidak ada keyword, tampilkan semua postingan
    $query = "SELECT p.id, p.user_id, p.content, p.image, p.created_at, u.username,
              (CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END) AS is_liked
              FROM posts p
              JOIN users u ON p.user_id = u.user_id
              LEFT JOIN post_likes l ON l.post_id = p.id AND l.user_id = p.user_id
              ORDER BY p.created_at DESC";
}

$post_id = $row['id'];
$comment_query = "SELECT c.content, c.created_at, u.username 
                  FROM comments c
                  JOIN users u ON c.user_id = u.user_id
                  WHERE c.post_id = $post_id
                  ORDER BY c.created_at ASC";
$comment_result = mysqli_query($con, $comment_query);


$result = mysqli_query($con, $query);
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
    <link href="css/community.css" rel="stylesheet">

    <!-- Google Fonts for Material Icons -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    


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
                        <a class="nav-link active text-white" aria-current="page" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="index.php#about">About</a>
                    </li>
                    <!-- Destination Dropdown -->
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
                    <!-- Event Dropdown -->
                    <li class="nav-item">
                        <a class="nav-link text-white" href="index.php#Event">Event</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="community.php">Community</a>
                    </li>
                </ul>
                <div>
                    <ul>
                        <!-- Profile Dropdown -->
                        <li class="nav-item profile-dropdown">
                            <div class="bi bi-person-circle text-white fs-4 me-2"></div>
                            <ul>
                                <li class="sub-item">
                                    <a href="profile.html" class="profile-link" style="text-decoration: none; display: flex; align-items: center;">
                                        <i class="bi bi-person-circle material-icons-outlined"></i>
                                        <p style="margin-left: 8px" >Profile</p>
                                    </a>
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

    <div class="content">
        <div class="left-panel">
            <div class="search-container">
                <form method="GET" action="">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" name="keyword" placeholder="Search posts..." value="<?php if(isset($_GET['keyword'])) echo $_GET['keyword']; ?>">
                </form>
            </div>
            <a href="index.php#nature-destination" style="text-decoration: none; color: inherit;">
                <div class="option"><i class="fas fa-tree"></i> Natural Destination</div>
            </a>
            <a href="index.php#culinary-destination" style="text-decoration: none; color: inherit;">
                <div class="option"><i class="fas fa-utensils"></i> Culinary Destination</div>
            </a>
            <a href="index.php#cultural-destination" style="text-decoration: none; color: inherit;">
                <div class="option"><i class="fas fa-landmark"></i> Cultural Destination</div>
            </a>
        </div>
    </div>

    <div class="main-content">
        <div class="post-box">
        <form action="post_submit.php" method="POST" enctype="multipart/form-data">
                <div class="post-header">
                    <img src="https://storage.googleapis.com/a1aa/image/VsypAsQ3mTahONwjGX6dJASjPLkEBJy1y98zMf69JcOm92zJA.jpg" alt="User Profile Picture" height="40" width="40">
                    <input type="text" name="content" placeholder="What's on your mind?" required>
                </div>
                <div class="post-actions" style="margin-top: 20px;">
                    <div>
                        <label for="image-upload"><i class="fas fa-camera"></i> Photo</label>
                        <input type="file" id="image-upload" name="image" accept="image/*" style="display: none;">
                    </div>
                    <button type="submit" style="background:none; border:none; color:inherit;">
                        <div><i class="fas fa-pencil-alt"></i> Post</div>
                    </button>
                </div>
            </form>
        </div>

            <div class="posts-container">
                <?php if (mysqli_num_rows($result) > 0): ?>
                    <?php while($row = mysqli_fetch_assoc($result)): ?>
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
                                    <div class="post-author-name"><?= $row['username']; ?></div>
                                    <div class="post-time"><?= date('d M Y H:i', strtotime($row['created_at'])); ?></div>
                                </div>
                            </div>
                            <div class="post-content">
                                <p><?= nl2br($row['content']); ?></p>
                                <!-- Display image if it exists -->
                                <?php if ($row['image']): ?>
                                    <img src="uploads/<?= $row['image']; ?>" alt="Post Image" style="max-width:100%; height:auto;">
                                <?php endif; ?>
                            </div>
                            <div class="post-actions">
                            <div class="like-button" data-post-id="<?= $row['id']; ?>" data-liked="<?= $row['is_liked']; ?>">
                                <i class="fas fa-thumbs-up"></i> Like
                            </div>

                            <div class="comment-button" data-post-id="<?= $row['id']; ?>">
                                <i class="fas fa-comment"></i> Comment
                            </div>
                            <div class="share-button" data-post-id="<?= $row['id']; ?>">
                                <i class="fas fa-share"></i> Share
                            </div>
                            </div>
                            <?php
        $post_id = $row['id'];
        $comment_query = "SELECT c.comment, c.created_at, u.username 
                          FROM comments c
                          JOIN users u ON c.user_id = u.user_id
                          WHERE c.post_id = $post_id
                          ORDER BY c.created_at ASC";
        $comment_result = mysqli_query($con, $comment_query);
        ?>
        
        <div class="comments-section">
            <?php if (mysqli_num_rows($comment_result) > 0): ?>
                <?php while ($comment = mysqli_fetch_assoc($comment_result)): ?>
                    <div class="comment">
                        <div class="comment-header">
                            <span class="comment-author"><?= htmlspecialchars($comment['username']); ?></span>
                            <span class="comment-date"><?= date('d M Y H:i', strtotime($comment['created_at'])); ?></span>
                        </div>
                        <div class="comment-content"><?= nl2br(htmlspecialchars($comment['comment'])); ?></div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p class="no-comments">No comments yet. Be the first to comment!</p>
            <?php endif; ?>
        </div>
                        </div>
                    <?php endwhile; ?>
                <?php else: ?>
                    <p>No search results for : '<?= $keyword; ?>'</p>
                <?php endif; ?>
            </div>
        </div>

        <div class="right-panel">
            <div class="event-card">
                <div class="event-header">
                    <h4><b>Upcoming Events</b></h4>
                    <a href="index.php#Event" class="see-all">See All</a>
                </div>
                <img src="image/event.jpg" alt="Lake Toba Festival" />
                <h4>Lake Toba Festival</h4>
                <p>22 Nov - 24 Nov 2024</p>
                <p>Rp498.000</p>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="js/post_action_community.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script>
document.addEventListener('DOMContentLoaded', function() {
    const likeButtons = document.querySelectorAll('.like-button');

    likeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const postId = this.getAttribute('data-post-id');
            const isLiked = this.getAttribute('data-liked');

            fetch('like_action.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `post_id=${postId}`,
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'liked') {
                    this.classList.add('liked');
                    this.setAttribute('data-liked', 'true');
                } else if (result === 'unliked') {
                    this.classList.remove('liked');
                    this.setAttribute('data-liked', 'false');
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });

    document.querySelector('.comment-button').addEventListener('click', function () {
        Swal.fire({
            title: 'Tulis Komentar',
            html: `<input type="text" id="commentInput" class="swal2-input" placeholder="Tulis komentar...">`,
            showCancelButton: true,
            cancelButtonText: 'Batal',
            confirmButtonText: 'Kirim',
            preConfirm: () => {
                const comment = document.getElementById('commentInput').value;
                if (!comment) {
                    Swal.showValidationMessage('Komentar tidak boleh kosong');
                }
                return comment;
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const comment = result.value;
                const postId = this.getAttribute('data-post-id');

                fetch('comment_action.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `post_id=${postId}&comment=${encodeURIComponent(comment)}`,
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        Swal.fire('Komentar berhasil dikirim!', '', 'success');
                    } else {
                        Swal.fire('Gagal mengirim komentar', '', 'error');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.fire('Terjadi kesalahan', '', 'error');
                });
            }
        });
    });

    // Implementasi untuk bagian share dengan pilihan metode
    const shareButtons = document.querySelectorAll('.share-button');

    shareButtons.forEach(button => {
        button.addEventListener('click', function() {
            const postId = button.closest('.post-box').getAttribute('data-post-id');

            // Tampilkan pilihan metode share dengan SweetAlert2
            Swal.fire({
                title: 'Bagikan melalui',
                input: 'select',
                inputOptions: {
                    whatsapp: 'WhatsApp',
                    email: 'Email',
                    other: 'Other'
                },
                inputPlaceholder: 'Pilih metode',
                showCancelButton: true,
                cancelButtonText: 'Batal',
                confirmButtonText: 'Bagikan',
            }).then((result) => {
                if (result.isConfirmed && result.value) {
                    const selectedMethod = result.value;

                    // Kirim pilihan share ke server hanya setelah memilih metode
                    fetch('share_action.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: `post_id=${postId}&method=${encodeURIComponent(selectedMethod)}`
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire('Shared!', data.message, 'success');
                        } else {
                            Swal.fire('Error!', data.message, 'error');
                        }
                    })
                    .catch(error => {
                        Swal.fire('Error!', 'Something went wrong!', 'error');
                        console.error('Error:', error);
                    });
                }
            });
        });
    });
});

</script>

</body>
</html>