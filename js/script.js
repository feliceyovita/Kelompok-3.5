const carousels = document.querySelectorAll(".wikit-carousel .wikit-carousel__carousel");
const arrowIcons = document.querySelectorAll(".wikit-carousel__wrapper i");

carousels.forEach((carousel, index) => {
    let firstImg = carousel.querySelectorAll("img")[0];
    let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;

    const showHideIcons = () => {
        // Show/hide prev/next icon according to carousel scroll left value
        let scrollWidth = carousel.scrollWidth - carousel.clientWidth; // Getting max scrollable width
        arrowIcons[index * 2].style.display = carousel.scrollLeft == 0 ? "none" : "block";
        arrowIcons[index * 2 + 1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
    }

    arrowIcons[index * 2].addEventListener("click", () => {
        let firstImgWidth = firstImg.clientWidth + 14; // Getting first img width & adding 14 margin value
        carousel.scrollLeft -= firstImgWidth; // Scroll to the left
        setTimeout(() => showHideIcons(), 60);
    });

    arrowIcons[index * 2 + 1].addEventListener("click", () => {
        let firstImgWidth = firstImg.clientWidth + 14; // Getting first img width & adding 14 margin value
        carousel.scrollLeft += firstImgWidth; // Scroll to the right
        setTimeout(() => showHideIcons(), 60);
    });

    const dragStart = (e) => {
        isDragStart = true;
        prevPageX = e.pageX || e.touches[0].pageX;
        prevScrollLeft = carousel.scrollLeft;
    }

    const dragging = (e) => {
        if (!isDragStart) return;
        e.preventDefault();
        isDragging = true;
        carousel.classList.add("dragging");
        positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
        carousel.scrollLeft = prevScrollLeft - positionDiff;
        showHideIcons();
    }

    const dragStop = () => {
        isDragStart = false;
        carousel.classList.remove("dragging");
        if (!isDragging) return;
        isDragging = false;
        autoSlide();
    }

    const autoSlide = () => {
        positionDiff = Math.abs(positionDiff);
        let firstImgWidth = firstImg.clientWidth + 14;
        let valDifference = firstImgWidth - positionDiff;
        if (carousel.scrollLeft > prevScrollLeft) {
            return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
        }
        carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
    }

    carousel.addEventListener("mousedown", dragStart);
    carousel.addEventListener("touchstart", dragStart);

    carousel.addEventListener("mousemove", dragging);
    carousel.addEventListener("touchmove", dragging);

    carousel.addEventListener("mouseup", dragStop);
    carousel.addEventListener("touchend", dragStop);
});

let currentIndex = 0; 
const cardsToShow = 4; 
const cardWidth = 260; 
const gap = 40; 
const slider = document.querySelector('.slider-calendar');
const totalCards = document.querySelectorAll('.month-card').length;
const leftButton = document.querySelector('.nav-button.left');
const rightButton = document.querySelector('.nav-button.right');

function updateButtonVisibility() {
    if (currentIndex === 0) {
        leftButton.style.display = 'none'; 
    } else {
        leftButton.style.display = 'flex'; 
    }
    
    if (currentIndex >= totalCards - cardsToShow) {
        rightButton.style.display = 'none';
    } else {
        rightButton.style.display = 'flex';
    }
}

function slideRight() {
    if (currentIndex < totalCards - cardsToShow) {
        currentIndex++;
        slider.style.transform = `translateX(-${(cardWidth + gap) * currentIndex}px)`;
        updateButtonVisibility(); 
    }
}

function slideLeft() {
    if (currentIndex > 0) {
        currentIndex--;
        slider.style.transform = `translateX(-${(cardWidth + gap) * currentIndex}px)`;
        updateButtonVisibility(); 
    }
}

updateButtonVisibility();