<?php
session_start(); // Start the session
include('config/conn.php');

// Handle login
if (isset($_POST['cek_login'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];

  if (empty($username) || empty($password)) {
    $error[] = 'Please enter username and password.';
  } else {
    // Fetch user data using parameterized query
    $query = "SELECT user_id, username, password_hash FROM users WHERE username = $1";
    $result = pg_query_params($con, $query, [$username]);

    if ($result && pg_num_rows($result) > 0) {
      $data = pg_fetch_assoc($result);
      if (password_verify($password, $data['password_hash'])) {
        $_SESSION['user_id'] = $data['user_id'];
        $_SESSION['username'] = $data['username'];
        header("Location: index.php");
        exit();
      } else {
        $error[] = 'Incorrect password.';
      }
    } else {
      $error[] = 'Username not found.';
    }
  }
}

// Handle signup
if (isset($_POST['signup'])) {
  $username = $_POST['username'];
  $email = $_POST['email'];
  $password = $_POST['password'];

  if (empty($username) || empty($email) || empty($password)) {
    $error[] = 'Please fill in all fields.';
  } else {
    // Check if user already exists
    $check_user_query = "SELECT 1 FROM users WHERE username = $1 OR email = $2";
    $check_user_result = pg_query_params($con, $check_user_query, [$username, $email]);

    if ($check_user_result && pg_num_rows($check_user_result) > 0) {
      $error[] = 'Username or email already exists.';
    } else {
      // Insert new user into the database
      $hashed_password = password_hash($password, PASSWORD_DEFAULT);
      $insert_query = "INSERT INTO users (username, email, password_hash) VALUES ($1, $2, $3)";
      $insert_result = pg_query_params($con, $insert_query, [$username, $email, $hashed_password]);

      if ($insert_result) {
        header("Location: login.php");
        exit();
      } else {
        $error[] = 'Something went wrong. Please try again.';
      }
    }
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Bootstrap and Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <title>WikiTrip</title>
</head>

<body>
  <div class="auth-page-container">
    <?php if (isset($error)) : ?>
      <?php foreach ($error as $err) : ?>
        <div class="alert alert-danger text-center"><?= htmlspecialchars($err) ?></div>
      <?php endforeach; ?>
    <?php endif; ?>

    <div class="forms-container">
      <div class="signin-signup">
        <form action="" method="POST" class="sign-in-form form-auth">
          <div class="logo-container">
            <img src="image/logo_wikitrip.png" alt="WikiTrip Logo" class="auth-logo">
            <h1 class="auth-brand"><span class="wiki">WIKI</span><span class="trip">TRIP</span></h1>
          </div>
          <h2 class="title auth-title">Sign in</h2>
          <div class="input-field auth-input-field">
            <i class="bi bi-person auth-icon"></i>
            <input type="text" class="auth-input" placeholder="Username" name="username" required>
          </div>
          <div class="input-field auth-input-field">
            <i class="bi bi-lock auth-icon"></i>
            <input type="password" class="auth-input" id="sign-in-password" placeholder="Password" name="password" required>
            <button type="button" class="toggle-password" onclick="togglePassword('sign-in-password', 'sign-in-toggle-icon')">
              <i class="bi bi-eye" id="sign-in-toggle-icon"></i>
            </button>
          </div>
          <input type="submit" value="Login" name="cek_login" class="btn solid auth-btn">
        </form>

        <form action="" method="POST" class="sign-up-form form-auth">
          <div class="logo-container">
            <img src="image/logo_wikitrip.png" alt="WikiTrip Logo" class="auth-logo">
            <h1 class="auth-brand"><span class="wiki">WIKI</span><span class="trip">TRIP</span></h1>
          </div>
          <h2 class="title auth-title">Sign up</h2>
          <div class="input-field auth-input-field">
            <i class="bi bi-person auth-icon"></i>
            <input type="text" class="auth-input" placeholder="Username" name="username" required>
          </div>
          <div class="input-field auth-input-field">
            <i class="bi bi-envelope auth-icon"></i>
            <input type="email" class="auth-input" placeholder="Email" name="email" required>
          </div>
          <div class="input-field auth-input-field">
            <i class="bi bi-lock auth-icon"></i>
            <input type="password" class="auth-input" id="sign-up-password" placeholder="Password" name="password" required>
            <button type="button" class="toggle-password" onclick="togglePassword('sign-up-password', 'sign-up-toggle-icon')">
              <i class="bi bi-eye" id="sign-up-toggle-icon"></i>
            </button>
          </div>
          <input type="submit" class="btn auth-btn" name="signup" value="Register">
        </form>
      </div>
    </div>

    <div class="panels-container auth-panels">
      <div class="panel left-panel auth-panel">
        <div class="content auth-content">
          <h3>First time here?</h3>
          <p>Join WikiTrip and begin your journey to endless destinations!</p>
          <button class="btn transparent" id="sign-up-btn">Sign up</button>
        </div>
        <img src="image/login.svg" class="image" alt="Sign in">
      </div>
      <div class="panel right-panel auth-panel">
        <div class="content auth-content">
          <h3>Back for more?</h3>
          <p>Sign in and let's keep exploring North Sumatera together!</p>
          <button class="btn transparent" id="sign-in-btn">Sign in</button>
        </div>
        <img src="image/register.svg" class="image" alt="Sign up">
      </div>
    </div>
  </div>

  <script src="js/login.js"></script>
</body>

</html>