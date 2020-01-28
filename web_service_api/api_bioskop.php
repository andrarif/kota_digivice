<?php

include_once "connection.php";

$query = "SELECT * FROM bioskop";
$result = mysqli_query($koneksi, $query);
$data_array = array();
while ($data = mysqli_fetch_assoc($result)) {
    $data_array[] = $data;
}

echo json_encode($data_array);
