<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Log function
function log_message($message) {
    error_log(date('[Y-m-d H:i:s] ') . $message . "\n", 3, 'email_log.txt');
}

log_message("Starting email process");

// Get the JSON data from the POST request
$data = json_decode(file_get_contents('php://input'), true);

// Get the image data from the JSON
$image_data = $data['image'];

// Decode the base64 image
list($type, $image_data) = explode(';', $image_data);
list(, $image_data) = explode(',', $image_data);
$image_data = base64_decode($image_data);

// Define the image file path
$image_file_path = 'customer_chart.png';

// Save the image to the file
if (file_put_contents($image_file_path, $image_data)) {
    log_message("Image saved successfully");
} else {
    log_message("Failed to save image");
    echo "Failed to save image";
    exit;
}

// Execute Python script to send email with the saved image
$command = escapeshellcmd('python send_email.py ' . $image_file_path);
log_message("Executing command: " . $command);
$output = shell_exec($command);

log_message("Python script output: " . $output);
echo $output;
?>