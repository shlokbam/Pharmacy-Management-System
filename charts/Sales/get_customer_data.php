<?php
// Connect to your database
$connection = new mysqli("localhost", "root", "", "pharmacy");

// Check the connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// Query to fetch customer_id and total price
$query = "SELECT customer_id, SUM(total_amount) as total_price FROM invoices GROUP BY customer_id";
$result = $connection->query($query);

$chartData = [];
$chartData[] = ['Customer ID', 'Total Price']; // Chart headers

$topCustomer = null;
$maxTotalPrice = 0;

// Loop through the query results and add data to the chart
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $customer_id = $row['customer_id'];
        $total_price = (float) $row['total_price'];
        $chartData[] = [$customer_id, $total_price];

        // Track the top customer by total price
        if ($total_price > $maxTotalPrice) {
            $maxTotalPrice = $total_price;
            $topCustomer = [$customer_id, $total_price];
        }
    }
}

// Output the data as JSON
echo json_encode(['chartData' => $chartData, 'topCustomer' => $topCustomer]);

// Close the connection
$connection->close();
?>
