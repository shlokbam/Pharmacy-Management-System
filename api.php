<?php
header("Content-Type: application/json"); // Set the response format to JSON

require 'db_connection.php'; // Include your database connection file

if ($con) {
    // Check for the requested action
    if (isset($_GET['action']) && $_GET['action'] == "get_medicines") {
        // Call the function to get medicines
        getMedicines();
    } elseif (isset($_GET['action']) && $_GET['action'] == "get_medicine") {
        // Get a specific medicine by ID
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        getMedicineById($id);
    } else {
        echo json_encode(["error" => "Invalid action specified."]);
    }
} else {
    echo json_encode(["error" => "Database connection failed."]);
}

function getMedicines() {
    global $con; // Use the global connection variable
    $query = "SELECT * FROM medicines_stock";
    $result = mysqli_query($con, $query);
    
    if ($result) {
        $medicines = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $medicines[] = $row; // Add each medicine to the array
        }
        echo json_encode($medicines); // Return the medicines as JSON
    } else {
        echo json_encode(["error" => "Failed to retrieve medicines."]);
    }
}

function getMedicineById($id) {
    global $con;
    $query = "SELECT * FROM medicines_stock WHERE id = $id";
    $result = mysqli_query($con, $query);
    
    if ($result) {
        $medicine = mysqli_fetch_assoc($result);
        if ($medicine) {
            echo json_encode($medicine); // Return the specific medicine as JSON
        } else {
            echo json_encode(["error" => "Medicine not found."]);
        }
    } else {
        echo json_encode(["error" => "Failed to retrieve medicine."]);
    }
}
?>
