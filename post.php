<div class="posts-container">
    <?php if (pg_num_rows($result) > 0): ?>
        <?php while ($row = pg_fetch_assoc($result)): ?>
            <div class="post-box" data-post-id="<?= htmlspecialchars($row['id']); ?>">
                <?php if (isset($_SESSION['user_id']) && $row['user_id'] == $_SESSION['user_id']): ?>
                    <div class="post-options">
                        <i class="fas fa-ellipsis-v options-icon"></i>
                        <div class="options-dropdown">
                            <a href="delete_post.php?post_id=<?= htmlspecialchars($row['id']); ?>&source_page=<?= htmlspecialchars($source_page); ?>" onclick="return confirm('Are you sure you want to delete this post?');">
                                <i class="fas fa-trash"></i>
                                <span>Delete Post</span>
                            </a>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="post-header">
                    <a href="profile.php?user_id=<?= htmlspecialchars($row['user_id']); ?>">
                        <?php
                        $profilePic = !empty($row['profile_picture']) ? htmlspecialchars($row['profile_picture']) : 'uploads/default_profile_picture.jpg';
                        ?>
                        <img src="<?= $profilePic; ?>" alt="User Profile Picture" height="40" width="40">
                    </a>
                    <div>
                        <div class="post-author-name"><?= htmlspecialchars($row['username']); ?></div>
                        <div class="post-time"><?= date('d M Y H:i', strtotime($row['created_at'])); ?></div>
                    </div>
                </div>
                <div class="post-content">
                    <p><?= nl2br(htmlspecialchars($row['content'])); ?></p>
                    <!-- Display image if it exists -->
                    <?php if (!empty($row['image'])): ?>
                        <img src="uploads/<?= htmlspecialchars($row['image']); ?>" alt="Post Image" style="max-width:100%; height:auto;">
                    <?php endif; ?>
                </div>
                <div class="post-actions">
                    <div class="like-button <?= isset($user_id) ? ($row['is_liked'] ? 'liked' : '') : 'disabled'; ?>"><?= htmlspecialchars($row['like_count']) . ' '; ?><i class="fas fa-thumbs-up"></i></div>
                    <div class="comment-button"><?= htmlspecialchars($row['comment_count']); ?> <i class="fas fa-comment"></i></div>
                    <div class="share-button"><i class="fas fa-share"></i></div>
                </div>
                <div class="comment-section" style="display: <?= isset($_GET['open_comments']) && $_GET['open_comments'] === 'true' ? 'block' : 'none'; ?>;">
                    <div class="post-box">
                        <form action="php_tools/add_comment.php?source_page=<?= urlencode($source_page); ?>" method="POST">
                            <div class="post-header">
                                <img alt="Profile Picture" src="<?= htmlspecialchars($profilePicture); ?>" height="40" width="40">
                                <input type="hidden" name="post_id" value="<?= htmlspecialchars($row['id']); ?>">
                                <input type="text" name="comment_text" class="comment-input" placeholder="Write comment..." required>
                                <div class="post-actions" style="margin-top: 20px;">
                                    <button type="submit" class="comment-input" style="background:none; border:none; color:inherit;">
                                        <div><i class="fas fa-pencil-alt"></i> Post</div>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="comment-list" data-post-id="<?= htmlspecialchars($row['id']); ?>">
                        <?php
                        $comments = getComments($row['id'], $con);
                        if (count($comments) > 0):
                            foreach ($comments as $comment): ?>
                                <div class="comment-item">
                                    <div class="post-header">
                                        <a href="profile.php?user_id=<?= htmlspecialchars($comment['user_id']); ?>">
                                            <img src="<?= htmlspecialchars($comment['profile_picture']); ?>" alt="<?= htmlspecialchars($comment['username']); ?>'s Profile Picture" height="40" width="40">
                                        </a>
                                        <div>
                                            <div class="comment-username"><?= htmlspecialchars($comment['username']); ?>
                                                <div class="comment-time"><?= date('d M Y H:i', strtotime($comment['created_at'])); ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="comment-text"><?= nl2br(htmlspecialchars($comment['comment_text'])); ?></p>
                                </div>
                            <?php endforeach;
                        else: ?>
                            <p>No comments yet.</p>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="share-popup" style="display: none;">
                    <div class="share-options">
                        <?php
                        $post_id = $row['id'];
                        $post_url = "https://wikiitrip.com/community.php?id=" . htmlspecialchars($post_id);
                        ?>
                        <div class="share-options">
                            <a href="https://www.facebook.com/sharer/sharer.php?u=<?= urlencode($post_url); ?>" target="_blank">
                                <i class="fab fa-facebook"> Facebook</i>
                            </a>
                            <a href="https://wa.me/?text=<?= urlencode($post_url); ?>" target="_blank">
                                <i class="fab fa-whatsapp"> WhatsApp</i>
                            </a>
                            <a href="https://www.instagram.com/?url=<?= urlencode($post_url); ?>" target="_blank">
                                <i class="fab fa-instagram"> Instagram</i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    <?php else: ?>
        <p>No search results for: '<?= htmlspecialchars($keyword); ?>'</p>
    <?php endif; ?>
</div>