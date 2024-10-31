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

// Query to fetch total sales per date
$sql = "SELECT INVOICE_DATE, SUM(TOTAL_AMOUNT) AS total_sales FROM invoices GROUP BY INVOICE_DATE";
$result = $conn->query($sql);

// Prepare data as JSON
$data = [];
$totalSales = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = [$row['INVOICE_DATE'], (float)$row['total_sales']];
        $totalSales[] = (float)$row['total_sales']; // Collect total sales for calculations
    }
}

// Calculate highest, lowest, and average sales
$highestSales = !empty($totalSales) ? max($totalSales) : 0;
$lowestSales = !empty($totalSales) ? min($totalSales) : 0;
$averageSales = !empty($totalSales) ? array_sum($totalSales) / count($totalSales) : 0;

// Close connection
$conn->close();

// Return data as JSON
echo json_encode([
    'salesData' => $data,
    'highestSales' => $highestSales,
    'lowestSales' => $lowestSales,
    'averageSales' => $averageSales,
]);
?>
