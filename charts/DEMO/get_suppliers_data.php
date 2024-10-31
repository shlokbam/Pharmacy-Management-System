<?php
// Database connection settings
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pharmacy";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to fetch all suppliers by medicine count
$sql = "SELECT SUPPLIER_NAME, COUNT(*) AS MedicineCount FROM medicines GROUP BY SUPPLIER_NAME ORDER BY MedicineCount DESC";
$result = $conn->query($sql);

// Prepare data for Google Charts
$data = [];
$data[] = ['Supplier Name', 'Medicine Count'];
$topSupplier = null;

if ($result->num_rows > 0) {
    $topSupplier = $result->fetch_assoc(); // Get the top supplier
    // Prepare the chart data
    do {
        $data[] = [$topSupplier['SUPPLIER_NAME'], (int)$topSupplier['MedicineCount']];
    } while ($topSupplier = $result->fetch_assoc()); // Fetch the rest
}

// Output both chart data and top supplier
echo json_encode(['chartData' => $data, 'topSupplier' => $data[1] ?? null]); // Provide top supplier data

// Close the connection
$conn->close();
?>
