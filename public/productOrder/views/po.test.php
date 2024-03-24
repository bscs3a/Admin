<?php
// Include your database connection file
require_once 'dbconn.php';

// Function to fetch and display all products
function displayProducts($conn)
{
    try {
        // Query to retrieve all products
        $query = "SELECT * FROM products";
        $statement = $conn->prepare($query);
        $statement->execute();

        // Check if there are any rows or results
        if ($statement->rowCount() > 0) {
            echo '<table class="w-full border-collapse bg-white text-left text-sm text-gray-500">';
            echo '<thead class="bg-gray-200">';
            echo '<tr class="border-b border-y-gray-300">';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900">Product ID</th>';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900">Product Name</th>';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900">Company</th>';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900">Price</th>';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900">Quantity</th>';
            echo '<th scope="col" class="px-6 py-4 font-medium text-gray-900"></th>'; // Empty header for the request button
            echo '</tr>';
            echo '</thead>';
            echo '<tbody class="divide-y divide-gray-100 border-b border-gray-300">';

            while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
                echo '<tr class="hover:bg-gray-50 data-row">';
                echo '<td class="px-6 py-4">' . $row['ProductID'] . '</td>';
                echo '<td class="px-6 py-4">' . $row['ProductName'] . '</td>';
                echo '<td class="px-6 py-4">' . $row['Supplier'] . '</td>';
                echo '<td class="px-6 py-4">' . $row['Price'] . '</td>';
                echo '<td class="px-6 py-4">';
                echo '<form action="test" method="POST" enctype="multipart/form-data">
                ';
                echo '<input type="hidden" id="quantity" name="productID" value="' . $row['ProductID'] . '">';
                echo '<input type="number" id="quantity" name="quantity" value="1" min="1" class="w-12 text-center">';
                echo '</td>';
                echo '<td class="px-6 py-4">';
                echo '<input type="submit"  value="Submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">';
                echo '</form>';
                echo '</td>';
                echo '</tr>';
            }

            echo '</tbody>';
            echo '</table>';
        } else {
            echo "No products found.";
        }
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
}

// // Check if the request is sent via POST method
// if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['requestBtn'])) {
//     // Retrieve data from the form
//     $productID = $_POST['productID'];
//     $quantity = $_POST['quantity'];

//     // Insert data into the "request" table
//     try {
//         // Prepare the SQL statement
//         $query = "INSERT INTO requests (Product_ID, Product_Quantity) VALUES (:productID, :quantity)";
//         $statement = $conn->prepare($query);

//         // Bind parameters
//         $statement->bindParam(':productID', $productID);
//         $statement->bindParam(':quantity', $quantity);

//         // Execute the statement
//         if ($statement->execute()) {
//             echo "Request saved successfully.";
//         } else {
//             echo "Failed to save request.";
//         }
//     } catch (PDOException $e) {
//         echo "Error: " . $e->getMessage();
//     }
// }

?>
<div class="p-4">
    <div class="overflow-hidden rounded-lg border border-gray-300 shadow-md m-5">
        <?php displayProducts($conn); ?>
    </div>
</div>
<script src="./../src/route.js"></script>
<script src="./../src/form.js"></script>