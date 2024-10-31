<?php
  require "db_connection.php";
  if($con) {
    $name = ucwords($_GET["name"]);
    $packing = strtoupper($_GET["packing"]);
    $generic_name = ucwords($_GET["generic_name"]);
    $suppliers_name = $_GET["suppliers_name"];

    $query = "SELECT * FROM medicines WHERE UPPER(NAME) = '".strtoupper($name)."' AND UPPER(PACKING) = '".strtoupper($packing)."' AND UPPER(SUPPLIER_NAME) = '".strtoupper($suppliers_name)."'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result);
    if($row)
      echo "Medicine $name with $packing already exists by supplier $suppliers_name!";
    else {
      $query = "INSERT INTO medicines (NAME, PACKING, GENERIC_NAME, SUPPLIER_NAME) VALUES('$name', '$packing', '$generic_name', '$suppliers_name')";
      $result = mysqli_query($con, $query);
      if(!empty($result))
  			echo "$name added...";
  		else
  			echo "Failed to add $name!";
    }
  }

        if(isset($_POST['add_medicine'])){
          $medicine_name = $_POST['medicine_name'];
          $medicine_price = $_POST['medicine_price'];
          $medicine_quantity = $_POST['medicine_quantity'];  // Add this field for stock
        
          // Insert into medicines table
          $query1 = "INSERT INTO medicines (name, price) VALUES ('$medicine_name', '$medicine_price')";
          $result1 = mysqli_query($conn, $query1);
        
          // Get the last inserted medicine id
          $medicine_id = mysqli_insert_id($conn);
        
          // Insert into stock or update stock for the added medicine
          $query2 = "INSERT INTO medicine_stock (medicine_id, stock_quantity) VALUES ('$medicine_id', '$medicine_quantity')";
          $result2 = mysqli_query($conn, $query2);
        
          if($result1 && $result2){
              echo "Medicine and stock added successfully!";
          } else {
              echo "Error adding medicine or stock!";
          } 
        } 
?>
