<?php
  require "db_connection.php";

  if($con) {
    if(isset($_GET["action"]) && $_GET["action"] == "delete") {
      $id = $_GET["id"];
      $query = "DELETE FROM medicines_stock WHERE BATCH_ID = '$id'";
      $result = mysqli_query($con, $query);
      if(!empty($result))
        showMedicinesStock(0);
    }

    if(isset($_GET["action"]) && $_GET["action"] == "edit") {
      $id = $_GET["id"];
      showMedicinesStock($id);
    }

    if(isset($_GET["action"]) && $_GET["action"] == "update") {
      $id = $_GET["id"];
      $batch_id = $_GET["batch_id"];
      $expiry_date = ucwords($_GET["expiry_date"]);
      $quantity = ucwords($_GET["quantity"]);
      $mrp = ucwords($_GET["mrp"]);
      $rate = ucwords($_GET["rate"]);
      updateMedicineStock($id, $batch_id, $expiry_date, $quantity, $mrp, $rate);
    }

    if(isset($_GET["action"]) && $_GET["action"] == "cancel")
      showMedicinesStock(0);

    if(isset($_GET["action"]) && $_GET["action"] == "search")
      searchMedicineStock(strtoupper($_GET["text"]), $_GET["tag"]);
  }

  function showMedicinesStock($id) {
    require "db_connection.php";
    if($con) {
      $seq_no = 0;
      $query = "SELECT * FROM medicines INNER JOIN medicines_stock ON medicines.NAME = medicines_stock.NAME";
      $result = mysqli_query($con, $query);
      while($row = mysqli_fetch_array($result)) {
        $seq_no++;
        if($row['BATCH_ID'] == $id)
          showEditOptionsRow($seq_no, $row);
        else
          showMedicineStockRow($seq_no, $row);
      }
    }
  }

  function showMedicineStockRow($seq_no, $row) {
    ?>
    <tr>
      <td><?php echo $seq_no; ?></td>
      <td><?php echo $row['NAME']; ?></td>
      <td><?php echo $row['PACKING']; ?></td>
      <td><?php echo $row['GENERIC_NAME']; ?></td>
      <td><?php echo $row['BATCH_ID']; ?></td>
      <td><?php echo $row['EXPIRY_DATE']; ?></td>
      <td><?php echo $row['SUPPLIER_NAME']; ?></td>
      <td><?php echo $row['QUANTITY']; ?></td>
      <td><?php echo $row['MRP']; ?></td>
      <td><?php echo $row['RATE']; ?></td>
      <td>
        <button href="" class="btn btn-info btn-sm" onclick="editMedicineStock('<?php echo $row['BATCH_ID']; ?>');">
          <i class="fa fa-pencil"></i>
        </button>
      </td>
    </tr>
    <?php
  }

function showEditOptionsRow($seq_no, $row) {
  ?>
  <tr>
    <td><?php echo $seq_no; ?></td>
    <td><?php echo $row['NAME']; ?></td>
    <td><?php echo $row['PACKING']; ?></td>
    <td><?php echo $row['GENERIC_NAME']; ?></td>
    <td>
      <input type="text" class="form-control" value="<?php echo $row['BATCH_ID']; ?>" placeholder="Batch ID" id="batch_id" onblur="notNull(this.value, 'batch_id_error');">
      <code class="text-danger small font-weight-bold float-right" id="batch_id_error" style="display: none;"></code>
    </td>
    <td>
      <input type="text" class="form-control" value="<?php echo $row['EXPIRY_DATE']; ?>" placeholder="Expiry" id="expiry_date" onblur="checkExpiry(this.value, 'expiry_date_error');">
      <code class="text-danger small font-weight-bold float-right" id="expiry_date_error" style="display: none;"></code>
    </td>
    <td><?php echo $row['SUPPLIER_NAME']; ?></td>
    <td>
      <input type="number" class="form-control" value="<?php echo $row['QUANTITY']; ?>" placeholder="Quantity" id="quantity" onkeyup="checkQuantity(this.value, 'quantity_error');">
      <code class="text-danger small font-weight-bold float-right" id="quantity_error" style="display: none;"></code>
    </td>
    <td>
      <input type="number" class="form-control" value="<?php echo $row['MRP']; ?>" placeholder="MRP" id="mrp" onkeyup="checkValue(this.value, 'mrp_error');">
      <code class="text-danger small font-weight-bold float-right" id="mrp_error" style="display: none;"></code>
    </td>
    <td>
      <input type="number" class="form-control" value="<?php echo $row['RATE']; ?>" placeholder="Rate" id="rate" onkeyup="checkValue(this.value, 'rate_error');">
      <code class="text-danger small font-weight-bold float-right" id="rate_error" style="display: none;"></code>
    </td>
    <td>
      <button href="" class="btn btn-success btn-sm" onclick="updateMedicineStock(<?php echo $row['BATCH_ID']; ?>);">
        <i class="fa fa-edit"></i>
      </button>
      <button class="btn btn-danger btn-sm" onclick="cancel();">
        <i class="fa fa-close"></i>
      </button>
    </td>
  </tr>
  <?php
}

function updateMedicineStock($id, $batch_id, $expiry_date, $quantity, $mrp, $rate) {
  require "db_connection.php";
  $query = "UPDATE medicines_stock SET BATCH_ID = '$batch_id', EXPIRY_DATE = '$expiry_date', QUANTITY = $quantity, MRP = $mrp, RATE = $rate WHERE BATCH_ID = '$id'";
  $result = mysqli_query($con, $query);
  if(!empty($result))
    showMedicinesStock(0);
}

function searchMedicineStock($text, $tag) {
  require "db_connection.php";
  if($con) {
    $seq_no = 0;
    $query = "";

    if($tag == "QUANTITY") {
      $query = "SELECT * FROM medicines INNER JOIN medicines_stock ON medicines.NAME = medicines_stock.NAME WHERE medicines_stock.QUANTITY = 0";
    }
    else if($tag == "EXPIRY_DATE") {
      $current_date = date('Y-m-d');
      $query = "SELECT * FROM medicines INNER JOIN medicines_stock ON medicines.NAME = medicines_stock.NAME WHERE STR_TO_DATE(CONCAT('01/', medicines_stock.EXPIRY_DATE), '%d/%m/%Y') < '$current_date'";
    }
    else {
      $query = "SELECT * FROM medicines INNER JOIN medicines_stock ON medicines.NAME = medicines_stock.NAME WHERE UPPER(medicines_stock.$tag) LIKE '%$text%'";
    }

    $result = mysqli_query($con, $query);

    if(mysqli_num_rows($result) == 0)
      echo "<tr><td colspan='10' class='text-center'>No medicines found for the given search criteria.</td></tr>";
    else {
      while($row = mysqli_fetch_array($result)) {
        $seq_no++;
        showMedicineStockRow($seq_no, $row);
      }
    }
  }
}
?>
