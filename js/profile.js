function showSection(sectionId) {
    document.getElementById('activities').style.display = 'none';
    document.getElementById('reviews').style.display = 'none';

    document.getElementById(sectionId).style.display = 'block';

    document.querySelectorAll('.profile-nav a').forEach((link) => {
        link.classList.remove('active');
    });

    document.querySelector(`.profile-nav a[onclick="showSection('${sectionId}')"]`).classList.add('active');
}
