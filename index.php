<?php
session_start();
include('config/conn.php');
include('config/function.php');

$isLoggedIn = isset($_SESSION['id_user']);

$query = "SELECT tourism_name, image_url FROM tourismplaces WHERE (tourism_id - 1) % 7 = 0 LIMIT 5";
$result = $con->query($query);
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

    <title>WikiTrip</title>

</head>

<body id="page-top">
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="main-nav">
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
                        <a class="nav-link text-white" href="#about">About</a>
                    </li>
                    <!-- Destination Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Destination
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#nature-destination">Nature destinations</a></li>
                            <li><a class="dropdown-item" href="#cultural-destination">Cultural destinations</a></li>
                            <li><a class="dropdown-item" href="#culinary-destination">Culinary destinations</a></li>
                        </ul>
                    </li>
                    <!-- Event Dropdown -->
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#Event">Event</a>
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
                                <?php if (isset($_SESSION['id_user'])): ?>
                                    <i class="bi bi-box-arrow-left material-icons-outlined"></i>
                                    <a href="login.php">
                                        <p>Login</p>
                                    </a>
                                <?php else: ?>
                                    <i class="bi bi-box-arrow-left material-icons-outlined"></i>
                                    <a href="logout.php">
                                        <p>Logout</p>
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

    <!-- slider -->
    <div class="slider">
        <div class="list">
            <?php
            if ($result->num_rows > 0) {
                $active = ' active';
                while ($row = $result->fetch_assoc()) {
                    $tourism_name = $row['tourism_name'];
                    $image_url = $row['image_url'];
                    ?>
                    <div class="item<?php echo $active; ?>">
                        <img src="<?php echo $image_url; ?>" alt="<?php echo $tourism_name; ?>">
                        <div class="content">
                            <p>Welcome To <span style="color: #f8b200;">SUMATERA UTARA</span></p>
                            <h1>Discover</h1>
                            <h2><span style="color:#f8b200;"><?php echo $tourism_name; ?></span></h2>
                        </div>
                    </div>
                    <?php
                    $active =''; 
                }
            } else {
                echo "<p>No data available</p>";
            }
            ?>
        </div>

        <!-- button arrows -->
        <div class="arrows">
            <button id="prev"></button>
            <button id="next"></button>
        </div>

        <!-- thumbnail -->
        <div class="thumbnail">
            <?php
            $result->data_seek(0);
            $active = ' active';
            while ($row = $result->fetch_assoc()) {
                $tourism_name = $row['tourism_name'];
                $image_url = $row['image_url'];
                ?>
                <div class="item <?php echo $active; ?>">
                    <img src="<?php echo $image_url; ?>" alt="<?php echo $tourism_name; ?>">
                    <div class="content">
                        <?php echo $tourism_name; ?>
                    </div>
                </div>
                <?php
                $active ='';
            }
            ?>
        </div>
    </div>

    <!-- About Section Start-->
    <section id="about" class="about">
        <h1 class="heading">
            <span style="color: #1c98ed;">A</span>bout
            <span style="color: #1c98ed;">U</span>s
        </h1>
        <div class="wrapper">
            <img src="image/1.png" alt="">
            <div class="text-box">
                <h2>Why Choose Us?</h2>
                <p>We are dedicated to help you explore amazing destinations. Our goal is to provide you with useful
                information. Whether you want to relax on the beach, hike in the mountains, or discover new
                cultures, we are here to guide you. Join us in exploring the world!</p> 
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <!-- <--card slider nature start --> 
    <div id="nature-destination" class="carousel-header">
        <h2>Nature Destination</h2>
        <p>Discover breathtaking natural wonders across various destinations. From majestic mountains to serene beaches,
            enjoy extraordinary experiences that will rejuvenate your soul.</p>
        <a href="nature.html" class="read-more-btn">Read More</a> <!-- Tambahkan tombol di sini -->
    </div>
    <div class="wikit-carousel">
        <div class="wikit-carousel__wrapper">
            <i id="left" class="fa-solid fa-angle-left">&lt;</i> <!-- Panah Kiri -->
            <div class="wikit-carousel__carousel">
                <?php
                // Query untuk mendapatkan semua data kota dan gambar
                $city = "
                    SELECT c.city_name, MIN(t.image_url) AS image_url
                    FROM cities c
                    LEFT JOIN tourismplaces t ON c.city_id = t.city_id
                    LEFT JOIN tourismcategories tc ON t.category_id = tc.category_id
                    WHERE tc.category_name = 'Nature Destination'
                    GROUP BY c.city_name
                ";
                $city_result = $con->query($city);
                if ($city_result->num_rows > 0) {
                    $cities = [];

                    while($row = $city_result->fetch_assoc()) {
                        $cityName = $row['city_name'];
                        $imageUrl = $row['image_url'] ? $row['image_url'] : 'image/background_nature.jpg'; 
                        if (!isset($cities[$cityName])) {
                            $cities[$cityName] = [];
                        }
                        $cities[$cityName][] = $imageUrl;
                    }
                    foreach ($cities as $cityName => $images) {
                        foreach ($images as $imageUrl) {
                            echo '
                                <div class="card">
                                    <img src="' . $imageUrl . '" alt="img" draggable="false">
                                    <div class="city-name">' . $cityName . '</div>
                                </div>
                            ';
                        }
                    }
                } else {
                    echo "Tidak ada kota yang ditemukan.";
                }
                ?>
            </div>
            <i id="right" class="fa-solid fa-angle-right">&gt;</i> <!-- Panah Kanan -->
        </div>
    </div>

    <!-- card slider cultural start -->
    <div id="cultural-destination" class="carousel-header">
        <h2>Cultural Destination</h2>
        <p>Explore cultural destinations where rich traditions and vibrant heritage come to life. Immerse yourself in
            experiences
            that inspire and enrich your soul.</p>
        <a href="cultural.html" class="read-more-btn">Read More</a> <!-- Tambahkan tombol di sini -->
    </div>
    <div class="wikit-carousel">
        <div class="wikit-carousel__wrapper">
            <i id="leftculture" class="fa-solid fa-angle-left">&lt;</i> <!-- Panah Kiri -->
            <div class="wikit-carousel__carousel">
                <?php
                    // Query untuk mendapatkan semua data kota dan gambar
                    $city = "
                        SELECT c.city_name, MIN(t.image_url) AS image_url
                        FROM cities c
                        LEFT JOIN tourismplaces t ON c.city_id = t.city_id
                        LEFT JOIN tourismcategories tc ON t.category_id = tc.category_id
                        WHERE tc.category_name = 'Cultural Destination'
                        GROUP BY c.city_name
                    ";
                    $city_result = $con->query($city);
                    if ($city_result->num_rows > 0) {
                        $cities = [];

                        while($row = $city_result->fetch_assoc()) {
                            $cityName = $row['city_name'];
                            $imageUrl = $row['image_url'] ? $row['image_url'] : 'image/background_nature.jpg'; 
                            if (!isset($cities[$cityName])) {
                                $cities[$cityName] = [];
                            }
                            $cities[$cityName][] = $imageUrl;
                        }
                        foreach ($cities as $cityName => $images) {
                            foreach ($images as $imageUrl) {
                                echo '
                                    <div class="card">
                                        <img src="' . $imageUrl . '" alt="img" draggable="false">
                                        <div class="city-name">' . $cityName . '</div>
                                    </div>
                                ';
                            }
                        }
                    } else {
                        echo "Tidak ada kota yang ditemukan.";
                    }
                ?>
            </div>
            <i id="rightculture" class="fa-solid fa-angle-right">&gt;</i> <!-- Panah Kanan -->
        </div>
    </div>

    <!-- card slider culinary start -->
    <div id="culinary-destination" class="carousel-header">
        <h2>Culinary Destination</h2>
        <p>Explore culinary destinations where rich flavors and traditions blend, offering unforgettable tastes that celebrate
        local cultures.</p>
        <a href="culinary.html" class="read-more-btn">Read More</a> <!-- Tambahkan tombol di sini -->
    </div>
    <div class="wikit-carousel">
        <div class="wikit-carousel__wrapper">
            <i id="leftculinary" class="fa-solid fa-angle-left">&lt;</i> <!-- Panah Kiri -->
            <div class="wikit-carousel__carousel">
                <?php
                    // Query untuk mendapatkan semua data kota dan gambar
                    $city = "
                        SELECT c.city_name, MIN(t.image_url) AS image_url
                        FROM cities c
                        LEFT JOIN tourismplaces t ON c.city_id = t.city_id
                        LEFT JOIN tourismcategories tc ON t.category_id = tc.category_id
                        WHERE tc.category_name = 'Culinary Destination'
                        GROUP BY c.city_name
                    ";
                    $city_result = $con->query($city);
                    if ($city_result->num_rows > 0) {
                        $cities = [];

                        while($row = $city_result->fetch_assoc()) {
                            $cityName = $row['city_name'];
                            $imageUrl = $row['image_url'] ? $row['image_url'] : 'image/background_nature.jpg'; 
                            if (!isset($cities[$cityName])) {
                                $cities[$cityName] = [];
                            }
                            $cities[$cityName][] = $imageUrl;
                        }
                        foreach ($cities as $cityName => $images) {
                            foreach ($images as $imageUrl) {
                                echo '
                                    <div class="card">
                                        <img src="' . $imageUrl . '" alt="img" draggable="false">
                                        <div class="city-name">' . $cityName . '</div>
                                    </div>
                                ';
                            }
                        }
                    } else {
                        echo "Tidak ada kota yang ditemukan.";
                    }
                ?>
            </div>
            <i id="rightculinary" class="fa-solid fa-angle-right">&gt;</i> <!-- Panah Kanan -->
        </div>
    </div>

<!-- Event section start -->
<div class="container-event" id="Event">
    <div class="event-banner">
        <img src="image/pikaso_edit.jpeg" alt="Event Banner" class="event-img">
        <div class="event-text">
            <h2>Best Event in <span style="font-weight: 600;">North Sumatera</span></h2>
            <p>Explore the Events in North Sumatera!</p>
        </div>
    </div>

    <!-- Calendar Event Section Start -->
    <div class="event-calendar">
            <h3>Calendar Event in 2024</h3>
            <div class="calendar-container">
                <button class="nav-button left" onclick="slideLeft()">
                    <i class="bi bi-chevron-left"></i>
                </button>
                <div class="slider-calendar">
                    <!-- January -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>January</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">01</span>
                                <span class="event-name">New Year's Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">15</span>
                                <span class="event-name">Festival A</span>
                            </div>
                        </div>
                    </div>
                    <!-- February -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>February</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">14</span>
                                <span class="event-name">Valentine's Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">20</span>
                                <span class="event-name">Festival B</span>
                            </div>
                        </div>
                    </div>
                    <!-- March -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>March</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">01</span>
                                <span class="event-name">New Year's Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">17</span>
                                <span class="event-name">Festival C</span>
                            </div>
                        </div>
                    </div>
                    <!-- April -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>April</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">01</span>
                                <span class="event-name">April Fools' Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">25</span>
                                <span class="event-name">Festival D</span>
                            </div>
                        </div>
                    </div>
                    <!-- May -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>May</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">01</span>
                                <span class="event-name">Labor Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">20</span>
                                <span class="event-name">Festival E</span>
                            </div>
                        </div>
                    </div>
                    <!-- June -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>June</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">01</span>
                                <span class="event-name">New Year's Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">15</span>
                                <span class="event-name">Festival F</span>
                            </div>
                        </div>
                    </div>
                    <!-- July -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>July</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">04</span>
                                <span class="event-name">Independence Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">20</span>
                                <span class="event-name">Festival G</span>
                            </div>
                        </div>
                    </div>
                    <!-- August -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>August</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">15</span>
                                <span class="event-name">Festival H</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">30</span>
                                <span class="event-name">National Day</span>
                            </div>
                        </div>
                    </div>
                    <!-- September -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>September</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">21</span>
                                <span class="event-name">Festival I</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">30</span>
                                <span class="event-name">Harvest Festival</span>
                            </div>
                        </div>
                    </div>
                    <!-- October -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>October</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">31</span>
                                <span class="event-name">Halloween</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">15</span>
                                <span class="event-name">Festival J</span>
                            </div>
                        </div>
                    </div>
                    <!-- November -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>November</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">11</span>
                                <span class="event-name">Veterans Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">30</span>
                                <span class="event-name">Festival K</span>
                            </div>
                        </div>
                    </div>
                    <!-- December -->
                    <div class="month-card">
                        <div class="month-header">
                            <h4>December</h4>
                        </div>
                        <div class="event-list">
                            <div class="event-item">
                                <span class="event-date">25</span>
                                <span class="event-name">Christmas Day</span>
                            </div>
                            <div class="event-item">
                                <span class="event-date">31</span>
                                <span class="event-name">New Year's Eve</span>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="nav-button right" onclick="slideRight()">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
        </div>

        <!-- Recommended Events Section Start -->
        <div class="recommended-events">
            <h3>Event Recommendation</h3>
            <div class="event-grid">
                <div class="event-card">
                    <img src="image/event.jpg" alt="" />
                    <h4>Lake Toba Festival</h4>
                    <p>22 Nov - 24 Nov 2024</p>
                    <p>Rp498.000</p>
                </div>
                <div class="event-card">
                    <img src="image/event.jpg" alt="" />
                    <h4>Pekan Raya North Sumatera</h4>
                    <p>02 Nov - 03 Nov 2024</p>
                    <p>Rp135.000</p>
                </div>
                <div class="event-card">
                    <img src="image/event.jpg" alt="Scent of Indonesia" />
                    <h4>Scent of Indonesia Vol. 2</h4>
                    <p>01 Nov - 03 Nov 2024</p>
                    <p>Rp30.000</p>
                </div>
            </div>
        </div>
        <!-- Recommended Events Section End -->
    </div>
    <!-- Event section end -->

    <script src="js/script.js"></script>
    <script src="js/app.js"></script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>