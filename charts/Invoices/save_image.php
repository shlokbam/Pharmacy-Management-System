<?php
// Get the JSON data from the POST request
$data = json_decode(file_get_contents('php://input'), true);

// Get the image data from the JSON
$image_data = $data['image'];

// Decode the base64 image
list($type, $image_data) = explode(';', $image_data);
list(, $image_data) = explode(',', $image_data);
$image_data = base64_decode($image_data);

// Define the image file path
$image_file_path = 'chart_image.png';

// Save the image to the file
file_put_contents($image_file_path, $image_data);

// Execute Python script to send email with the saved image
$command = escapeshellcmd('python send_email.py ' . $image_file_path);
$output = shell_exec($command);

echo $output;
?>