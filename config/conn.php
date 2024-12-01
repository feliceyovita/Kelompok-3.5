<?php

    $hostname   = "localhost";
    $port       = "5432";
    $username   = "postgres";
    $password   = "admin";
    $database   = "wikitrip";

    $con = pg_connect("host=$hostname port=$port dbname=$database user=$username password=$password");

    if (!$con) {
        die("Connection failed: " . pg_last_error());
    }

?>
