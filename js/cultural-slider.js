const carousel = document.querySelector(".wikit-carousel .wikit-carousel__carousel"),
    firstImg = carousel.querySelectorAll("img")[0],
    arrowIcons = document.querySelectorAll(".wikit-carousel__wrapper i");

let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;

const showHideIcons = () => {
    // Show/hide prev/next icon according to carousel scroll left value
    let scrollWidth = carousel.scrollWidth - carousel.clientWidth; // Getting max scrollable width
    arrowIcons[0].style.display = carousel.scrollLeft == 0 ? "none" : "block";
    arrowIcons[1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
}

arrowIcons.forEach(icon => {
    icon.addEventListener("click", () => {
        let firstImgWidth = firstImg.clientWidth + 14; // Getting first img width & adding 14 margin value
        // If click icon is left, reduce width value from the carousel scroll left else add to it
        carousel.scrollLeft += icon.id == "leftcultur" ? firstImgWidth : -firstImgWidth; // Tombol prev dan next dibalik
        setTimeout(() => showHideIcons(), 60); // Calling showHideIcons after 60ms
    });
});

const autoSlide = () => {
    // There is no image left to scroll then return from here
    if (carousel.scrollLeft == (carousel.scrollWidth - carousel.clientWidth)) return;

    positionDiff = Math.abs(positionDiff); // Making positionDiff value to positive
    let firstImgWidth = firstImg.clientWidth + 14;
    // Getting difference value that need to add or reduce from carousel left to make middle img center
    let valDifference = firstImgWidth - positionDiff;

    if (carousel.scrollLeft > prevScrollLeft) { // If user is scrolling to the right
        return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
    }
    // If user is scrolling to the left
    carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
}

const dragStart = (e) => {
    // Updating global variable value on mouse down event
    isDragStart = true;
    prevPageX = e.pageX || e.touches[0].pageX;
    prevScrollLeft = carousel.scrollLeft;
}

const dragging = (e) => {
    // Scrolling images/carousel to left according to mouse pointer
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

// Adding event listeners for dragging functionality
carousel.addEventListener("mousedown", dragStart);
carousel.addEventListener("touchstart", dragStart);

carousel.addEventListener("mousemove", dragging);
carousel.addEventListener("touchmove", dragging);

carousel.addEventListener("mouseup", dragStop);
carousel.addEventListener("mouseleave", dragStop);
carousel.addEventListener("touchend", dragStop);  

document.addEventListener("DOMContentLoaded", function () {
    // Fungsi untuk menggeser slider
    function shiftSlider(direction) {
        const firstImgWidth = firstImg.clientWidth + 14; // Getting first img width & adding 14 margin value

        if (direction === 'next') {
            // Scroll to the left (next)
            carousel.scrollLeft += firstImgWidth; // Shift next
        } else if (direction === 'prev') {
            // Scroll to the right (prev)
            carousel.scrollLeft -= firstImgWidth; // Shift prev
        }

        // Update visibility of icons
        setTimeout(() => showHideIcons(), 60); // Calling showHideIcons after 60ms
    }

    // Event listener untuk tombol prev dan next
    document.querySelectorAll('[id^="leftcultur"]').forEach(button => {
        button.addEventListener('click', () => {
            shiftSlider('prev'); // Shift prev
        });
    });

    document.querySelectorAll('[id^="rightcultur"]').forEach(button => {
        button.addEventListener('click', () => {
            shiftSlider('next'); // Shift next
        });
    });
});



