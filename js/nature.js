// navbar scrolled
const navE1 = document.querySelector('.navbar');

let events = {
    mouse: {
        over: "click",
    },
    touch: {
        over: "touchstart",
    },
};

let deviceType = "";
let selectedRating = 0;

const isTouchDevice = () => {
    try {
        document.createEvent("TouchEvent");
        deviceType = "touch";
        return true;
    } catch (e) {
        deviceType = "mouse";
        return false;
    }
};

isTouchDevice();

starContainer.forEach((element, index) => {
    element.addEventListener(events[deviceType].over, () => {
        submitButton.disabled = false;
        ratingUpdate(0, starContainer.length - 1, false);
        ratingUpdate(0, index, true);
        selectedRating = index + 1;
        updateRatingDisplay(selectedRating); 
    });
});
const ratingUpdate = (start, end, active) => {
    for (let i = start; i <= end; i++) {
        if (active) {
            starContainer[i].classList.add("active");
            starContainer[i].classList.remove("inactive");
            starContainer[i].firstElementChild.className = "fa-star fa-solid";
        } else {
            starContainer[i].classList.remove("active");
            starContainer[i].classList.add("inactive");
            starContainer[i].firstElementChild.className = "fa-star fa-regular";
        }
    }

    let activeElements = document.getElementsByClassName("active");
    if (activeElements.length > 0) {
        switch (activeElements.length) {
            case 1:
                message.innerText = "Terrible";
                break;
            case 2:
                message.innerText = "Bad";
                break;
            case 3:
                message.innerText = "Satisfied";
                break;
            case 4:
                message.innerText = "Good";
                break;
            case 5:
                message.innerText = "Excellent";
                break;
        }
    } else {
        message.innerText = "Rate Your Experience";
    }
};

const updateRatingDisplay = (rating) => {
    let starsHTML = '';
    for (let i = 1; i <= 5; i++) {
        if (i <= rating) {
            starsHTML += '★';  
        } else {
            starsHTML += '☆';  
        }
    }
    dynamicRating.innerHTML = `${starsHTML} (${rating}/5)`; 
};

document.addEventListener("click", (event) => {
    if (!event.target.closest(".star-container") && !event.target.closest("#submit")) {
        ratingUpdate(0, starContainer.length - 1, false);
        message.innerText = "Rate Your Experience";
        submitButton.disabled = true;
        selectedRating = 0;
        updateRatingDisplay(0); 
    };
window.addEventListener('scroll', () => {
    if (window.scrollY >= 56) {
        navE1.classList.add('navbar-scrolled');
    } else {
        navE1.classList.remove('navbar-scrolled');
    }
    });
    });
        
// Load More functionality
let loadMoreBtn = document.getElementById('loadMoreBtn');
let discoverCards = document.querySelectorAll('.discover__card');
let visibleCards = 8; 

// Function to show discover cards
function showDiscoverCards() {
    discoverCards.forEach((card, index) => {
        card.style.display = 'none';
    });

    for (let i = 0; i < visibleCards; i++) {
        if (discoverCards[i]) {
            discoverCards[i].style.display = 'block';
        }
    }

    if (visibleCards >= discoverCards.length) {
        loadMoreBtn.style.display = 'none';
    }
}

showDiscoverCards();

loadMoreBtn.addEventListener('click', () => {
    visibleCards += 8; 
    showDiscoverCards(); 
});