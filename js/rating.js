let starContainer = document.querySelectorAll(".star-container"); //rating
const submitButton = document.querySelector("#submit");
const message = document.querySelector("#message");
const submitSection = document.querySelector("#submit-section");
const dynamicRating = document.querySelector("#dynamic-rating"); 

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
            case 5:
                message.innerText = "Satisfied";
                break;
            case 2:
                message.innerText = "Terrible";
                break;
            case 3:
                message.innerText = "Bad";
                break;
            case 4:
                message.innerText = "Good";
                break;
            case 1:
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

submitButton.addEventListener("click", (event) => {
    event.preventDefault();
    if (selectedRating > 0) {
        if (message.innerText !== "Thanks for your feedback!") {
            message.innerText = "Thanks for your feedback!";
            submitSection.classList.remove("hide");
            submitButton.style.display = "none"; 
        }
    } 
});

document.addEventListener("click", (event) => {
    if (!event.target.closest(".star-container") && !event.target.closest("#submit")) {
        ratingUpdate(0, starContainer.length - 1, false);
        message.innerText = "Rate Your Experience";
        submitButton.disabled = true;
        selectedRating = 0;
        updateRatingDisplay(0); 
    }
});

window.onload = () => {
    submitButton.disabled = true;
    submitSection.classList.add("hide");
    message.innerText = "Rate Your Experience";
};