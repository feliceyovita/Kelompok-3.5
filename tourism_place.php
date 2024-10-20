<?php
session_start();
include('config/conn.php');

$tourism_id = isset($_GET['tourism_id']) ? (int)$_GET['tourism_id'] : 0;
$query = "SELECT tourism_name, image_url, map_url, description FROM tourismplaces WHERE tourism_id = $tourism_id";
$result = $con->query($query);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $tourism_name = $row['tourism_name'];
    $image_url = $row['image_url'];
    $map_url = $row['map_url'];
    $description = $row['description'];
} else {
    echo "Data tidak ditemukan.";
    exit; 
}
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <title>WikiTrip</title>
</head>

<body id="page-top">

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="main-nav" style="background-color: rgba(0, 0, 0, 0.303);">
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
                        <a class="nav-link text-white" href="#About">About</a>
                    </li>
                    <!-- Destination Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Destination
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="nature.html">Nature destinations</a></li>
                            <li><a class="dropdown-item" href="cultural.html">Cultural destinations</a></li>
                            <li><a class="dropdown-item" href="culinary.html">Culinary destinations</a></li>
                        </ul>
                    </li>
                    <!-- Event Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdownEvent" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Events
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownEvent">
                            <li><a class="dropdown-item" href="#Music">Music Events</a></li>
                            <li><a class="dropdown-item" href="#Culinary">Culinary events</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#Community">Community</a>
                    </li>
                </ul>
                <div>
                    <ul>
                        <!-- Profile Dropdown -->
                        <li class="nav-item profile-dropdown">
                            <div class="bi bi-person-circle text-white fs-4 me-2"></div>
                            <ul>
                                <li class="sub-item">
                                    <i class="bi bi-chat-heart material-icons-outlined"></i>
                                    <p>Activity</p>
                                </li>
                                <li class="sub-item">
                                    <i class="bi bi-bookmark material-icons-outlined"></i>
                                    <p>Bookmark</p>
                                </li>
                                <li class="sub-item">
                                    <i class="bi bi-box-arrow-left material-icons-outlined"></i>
                                    <p>Logout</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div class="main-content"> 
        <h1 class="content-title"><?php echo $tourism_name; ?></h1>
            <button class="btn btn-outline-primary ms-3">
                <i class="fa-solid fa-bookmark"></i> Save
            </button>
        </h1>        
        <hr class="content-divider">
        
        <div style="display: flex; align-items: flex-start; justify-content: center;">
            <div style="margin-right: 20px;">
                <img src="<?php echo $image_url; ?>" alt="<?php echo $tourism_name; ?>" style="width: 700px; height: 400px; margin-bottom: 20px;">
            </div>
            <div>
                <"<?php echo $map_url; ?>" width="560" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>

        <div class="card" style="margin-top: 20px;">
            <div class="card-body" style="display: flex; flex-direction: column; align-items: flex-start;">
                <h2 class="card-title">Rating</h2>
                <p class="card-rating" id="dynamic-rating">☆☆☆☆☆ (0/5)</p> 
                <h2 class="card-title">Deskripsi</h2>
                <p class="card-description" style="text-align: left;">
                    <?php echo $description; ?>
                </p>
            </div>
        </div>

        <div class="wrapper-rating">
            <p id="message">Rate Your Experience</p>
            <div class="container-rating">
                <div class="star-container inactive" data-value="1">
                    <i class="fa-regular fa-star"></i>
                    <span class="number">1</span>
                </div>
                <div class="star-container inactive" data-value="2">
                    <i class="fa-regular fa-star"></i>
                    <span class="number">2</span>
                </div>
                <div class="star-container inactive" data-value="3">
                    <i class="fa-regular fa-star"></i>
                    <span class="number">3</span>
                </div>
                <div class="star-container inactive" data-value="4">
                    <i class="fa-regular fa-star"></i>
                    <span class="number">4</span>
                </div>
                <div class="star-container inactive" data-value="5">
                    <i class="fa-regular fa-star"></i>
                    <span class="number">5</span>
                </div>
            </div>
            <button id="submit" disabled>Submit</button>
            <div id="submit-section" class="hide">
                <p id="submit-message">Thanks for your feedback</p>
            </div>
        </div>
    </div>

    <footer class="wikitrip-footer-section">
        <div class="wikitrip-footer-container">
            <div class="wikitrip-footer-column">
                <h2>Logo</h2>
                <p class="wikitrip-footer-paragraph">"Wikitrip offers insights into the beauty and culture of North
                    Sumatra,
                    guiding travelers through unforgettable experiences."</p>
            </div>
            <div class="wikitrip-footer-column">
                <h3 class="wikitrip-footer-text-office">
                    Office
                    <div class="wikitrip-footer-underline"><span></span></div>
                </h3>
                <p>Jl. Universitas No.9</p>
                <p>Padang Bulan, Medan</p>
                <p>Sumatera Utara, Indonesia</p>
                <p class="wikitrip-footer-email">info.wikitrip@gmail.com</p>
                <p class="wikitrip-footer-phone">+62 821 7777 9090</p>
            </div>
            <div class="wikitrip-footer-column">
                <h3>
                    Menu
                    <div class="wikitrip-footer-underline"><span></span></div>
                </h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Destination</a></li>
                    <li><a href="#">Event</a></li>
                    <li><a href="#">Community</a></li>
                </ul>
            </div>
            <div class="wikitrip-footer-column">
                <h3>
                    Newsletter
                    <div class="wikitrip-footer-underline"><span></span></div>
                </h3>
                <form action="">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" placeholder="Enter Your Email">
                    <a href=""><i class="fa-solid fa-arrow-right"></i></a>
                </form>
                <div class="wikitrip-footer-social-icons">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                    <a href="#"><i class="fa-brands fa-google-plus"></i></a>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="js/nature.js"></script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>