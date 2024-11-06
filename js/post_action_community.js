document.addEventListener('DOMContentLoaded', () => {
    // Menangani tombol Like
    document.querySelectorAll('.like-button').forEach(button => {
        button.addEventListener('click', () => {
            const post = button.closest('.post-box');
            const postId = post.getAttribute('data-post-id');
            const isLiked = button.classList.toggle('liked');

            fetch('like_post.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ postId, like: isLiked })
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.message);
                // Update UI jika perlu, misalnya mengubah warna tombol atau menghitung jumlah like
            })
            .catch(error => console.error('Error:', error));
        });
    });

    // Menangani tombol Comment
    document.querySelectorAll('.comment-button').forEach(button => {
        button.addEventListener('click', () => {
            const commentSection = button.closest('.post-box').querySelector('.comment-section');
            commentSection.style.display = commentSection.style.display === 'none' ? 'block' : 'none';
        });
    });

    // Menangani tombol Share
    document.querySelectorAll('.share-button').forEach(button => {
        button.addEventListener('click', () => {
            const sharePopup = button.closest('.post-box').querySelector('.share-popup');
            sharePopup.style.display = sharePopup.style.display === 'none' ? 'block' : 'none';
        });
    });

    // Menangani pengiriman komentar
    document.querySelectorAll('.comment-submit').forEach(button => {
        button.addEventListener('click', () => {
            const post = button.closest('.post-box');
            const postId = post.getAttribute('data-post-id');
            const commentInput = post.querySelector('.comment-input');
            const commentText = commentInput.value;

            if (commentText.trim() !== '') {
                fetch('add_comment.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ postId, commentText })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        const commentList = post.querySelector('.comment-list');
                        const newComment = document.createElement('div');
                        newComment.textContent = data.commentText; // Assuming you get the comment text back
                        commentList.appendChild(newComment);
                        commentInput.value = ''; // Clear input
                    } else {
                        console.error('Failed to add comment:', data.message);
                    }
                })
                .catch(error => console.error('Error:', error));
            }
        });
    });
});
