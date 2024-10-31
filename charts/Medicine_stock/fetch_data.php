<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pharmacy";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from medicines_stock table
$sql = "SELECT 
    COUNT(*) AS total_medicines, 
    SUM(CASE WHEN QUANTITY = 0 THEN 1 ELSE 0 END) AS out_of_stock_medicines
    FROM medicines_stock";

$result = $conn->query($sql);

// Data for chart
$data = array();
if ($result->num_rows > 0) {
    // Fetch the results
    $row = $result->fetch_assoc();

    // Calculate available medicines as total medicines minus out of stock medicines
    $available_medicines = (int)$row['total_medicines'] - (int)$row['out_of_stock_medicines'];

    // Debugging output to ensure data is correct
    error_log("Total Medicines: " . $row['total_medicines']);
    error_log("Out of Stock Medicines: " . $row['out_of_stock_medicines']);
    error_log("Available Medicines: " . $available_medicines);

    // Prepare data for Google Charts
    $data = array(
        array('Status', 'Count'),
        array('Available Medicines', $available_medicines),
        array('Out of Stock Medicines', (int)$row['out_of_stock_medicines'])
    );
} else {
    // Default values if no data is found
    $data = array(
        array('Status', 'Count'),
        array('Available Medicines', 0),
        array('Out of Stock Medicines', 0)
    );
}

// Return data as JSON for Google Charts
header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
