// Image carousel functionality
const carousels = document.querySelectorAll(".wikit-carousel .wikit-carousel__carousel");
const arrowIcons = document.querySelectorAll(".wikit-carousel__wrapper i");

carousels.forEach((carousel, index) => {
    const firstImg = carousel.querySelector("img");

    const showHideIcons = () => {
        const scrollWidth = carousel.scrollWidth - carousel.clientWidth;
        arrowIcons[index * 2].style.display = carousel.scrollLeft === 0 ? "none" : "block";
        arrowIcons[index * 2 + 1].style.display = carousel.scrollLeft >= scrollWidth ? "none" : "block";
    };

    const slideCarousel = (direction) => {
        const firstImgWidth = firstImg.clientWidth + 14; // Adjust for margins
        carousel.scrollLeft += direction * firstImgWidth;
        setTimeout(showHideIcons, 60);
    };

    // Left and right arrow click listeners
    arrowIcons[index * 2].addEventListener("click", () => slideCarousel(-1));
    arrowIcons[index * 2 + 1].addEventListener("click", () => slideCarousel(1));

    const updateCarouselLayout = () => {
        const cards = carousel.querySelectorAll('.card');
        const screenWidth = window.innerWidth;
        const cardsPerRow = screenWidth < 480 ? 1 : screenWidth < 768 ? 2 : 3;

        carousel.style.width = `${cardsPerRow * 100}%`;
        cards.forEach(card => {
            card.style.width = `${100 / cardsPerRow}%`;
            card.style.margin = '10px';
        });

        showHideIcons();
    };

    window.addEventListener('resize', updateCarouselLayout);
    updateCarouselLayout(); // Initial setup
});

// Monthly calendar slider functionality
let currentIndex = 0;
const cardsToShow = 4;
const cardWidth = 260; // Change according to your card width
const gap = 40;
const slider = document.querySelector('.slider-calendar');
const totalCards = document.querySelectorAll('.month-card').length;
const calendarLeftButton = document.querySelector('.nav-button.left');
const calendarRightButton = document.querySelector('.nav-button.right');

const updateCalendarButtonVisibility = () => {
    calendarLeftButton.style.display = currentIndex === 0 ? 'none' : 'flex';
    calendarRightButton.style.display = currentIndex >= totalCards - cardsToShow ? 'none' : 'flex';
};

const slideCalendar = (direction) => {
    if ((direction === 1 && currentIndex < totalCards - cardsToShow) || 
        (direction === -1 && currentIndex > 0)) {
        currentIndex += direction;
        slider.style.transform = `translateX(-${(cardWidth + gap) * currentIndex}px)`;
        updateCalendarButtonVisibility();
    }
};

// Calendar navigation buttons
calendarLeftButton.addEventListener('click', () => slideCalendar(-1));
calendarRightButton.addEventListener('click', () => slideCalendar(1));

// Initialize calendar button visibility
updateCalendarButtonVisibility();

// Event grid slider functionality
let eventCurrentIndex = 0;

const calculateVisibleCards = () => {
    const eventGridWrapper = document.querySelector('.event-grid-wrapper');
    const eventCardWidth = document.querySelector('.event-card').offsetWidth + 15; // Card width + margin
    return Math.floor(eventGridWrapper.offsetWidth / eventCardWidth);
};

const slideEventGrid = (direction) => {
    const eventGrid = document.querySelector('.event-grid');
    const eventCardWidth = document.querySelector('.event-card').offsetWidth + 15; // Card width + margin
    const visibleCards = calculateVisibleCards();
    const totalCards = document.querySelectorAll('.event-card').length;

    if (direction === -1) {
        eventCurrentIndex = Math.max(eventCurrentIndex - 1, 0); // Move left by one
    } else if (direction === 1) {
        eventCurrentIndex = Math.min(eventCurrentIndex + 1, totalCards - visibleCards); // Move right by one
    }

    eventGrid.style.transform = `translateX(-${eventCurrentIndex * eventCardWidth}px)`;
};

// Add left and right buttons for the event recommendation slider
const eventLeftButton = document.querySelector('.event-nav-button.left'); 
const eventRightButton = document.querySelector('.event-nav-button.right'); 

eventLeftButton.addEventListener('click', () => slideEventGrid(-1));
eventRightButton.addEventListener('click', () => slideEventGrid(1));

// Initialize the event recommendation slider
const initEventSlider = () => {
    eventCurrentIndex = 0; // Reset index at initialization
    document.querySelector('.event-grid').style.transform = 'translateX(0)';
};

// Update visible cards on resize
window.addEventListener('resize', () => {
    initEventSlider(); // Reset on size change
});

// Call the initialization function for the event slider
initEventSlider();


document.addEventListener('DOMContentLoaded', function () {
    const carousels = document.querySelectorAll('.wikit-carousel');
    
    carousels.forEach((carousel) => {
        const wrapper = carousel.querySelector('.wikit-carousel__carousel');
        const leftArrow = carousel.querySelector('.fa-angle-left');
        const rightArrow = carousel.querySelector('.fa-angle-right');
        const cardWidth = 250; // Fixed width for cards
        
        // Calculate max scroll width for boundaries
        const maxScroll = wrapper.scrollWidth - wrapper.clientWidth;
        
        let scrollPosition = 0;

        // Update scroll and boundary checks
        const slide = (direction) => {
            scrollPosition += direction * cardWidth;
            scrollPosition = Math.max(0, Math.min(scrollPosition, maxScroll));
            wrapper.scrollTo({ left: scrollPosition, behavior: 'smooth' });
            updateArrows();
        };

        const updateArrows = () => {
            leftArrow.style.display = scrollPosition === 0 ? 'none' : 'block';
            rightArrow.style.display = scrollPosition >= maxScroll ? 'none' : 'block';
        };

        // Arrow event listeners
        leftArrow.addEventListener('click', () => slide(-1));
        rightArrow.addEventListener('click', () => slide(1));

        // Initial setup for arrow visibility
        updateArrows();
        
        // Resize event to adjust visibility
        window.addEventListener('resize', () => {
            scrollPosition = 0;
            wrapper.scrollTo({ left: 0 });
            updateArrows();
        });
    });
});


    // Next and previous buttons functionality
    document.getElementById('next').addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % items.length;
        setActiveSlide(currentIndex);
    });

    document.getElementById('prev').addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + items.length) % items.length;
        setActiveSlide(currentIndex);
    });
    document.addEventListener('DOMContentLoaded', function () {
        const carousels = document.querySelectorAll('.wikit-carousel');
        
        carousels.forEach((carousel) => {
            const wrapper = carousel.querySelector('.wikit-carousel__carousel');
            const leftArrow = carousel.querySelector('.fa-angle-left');
            const rightArrow = carousel.querySelector('.fa-angle-right');
            let scrollAmount = 0;
            const cardWidth = wrapper.querySelector('.card').offsetWidth + 10; // Add the gap between cards
            
            rightArrow.addEventListener('click', () => {
                scrollAmount += cardWidth;
                wrapper.scrollTo({ left: scrollAmount, behavior: 'smooth' });
            });
            
            leftArrow.addEventListener('click', () => {
                scrollAmount -= cardWidth;
                wrapper.scrollTo({ left: scrollAmount, behavior: 'smooth' });
            });
        });
    });