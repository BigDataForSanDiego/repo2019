#!/usr/local/bin/php
<?php
require_once 'phpsqlinfo_dbinfo.php';

// Gets data from URL parameters.
$name = $_GET['name'];
$comment = $_GET['comment'];
$lat = $_GET['lat'];
$lng = $_GET['lng'];
$type = $_GET['type'];

// Opens a connection to a MySQL server.
$connection= new mysqli($hn, $username, $password, $database);
if ($connection->connect_error) {
  die($connection->connect_error);
}


// Inserts new row with place data.
$query = sprintf("INSERT INTO markers " .
         " (id, name, comment, lat, lng, type ) " .
         " VALUES (NULL, '%s', '%s', '%s', '%s', '%s');",
         mysqli_real_escape_string($name),
         mysqli_real_escape_string($comment),
         mysqli_real_escape_string($lat),
         mysqli_real_escape_string($lng),
         mysqli_real_escape_string($type));

$result = $connection->query($query);

if (!$result) {
  die('Invalid query: ' . $connection->connect_error);
}

?>