<?php
    $connectflag = true;

    // include database connection details
    require_once('config.php');
    
    // connect to mysql server
    $conn = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_DATABASE);
    if($conn->connect_error) {
        echo('Failed to connect to server: ' . $conn->connect_error);
        $connectflag = false;
    }
    
    // get the search parameters (post)
    $searchText = trim($_POST['searchText']);
    $categoryValue = trim($_POST['category']);
    
    if ($connectflag) {
        // create SELECT query
        $sql = "";
        $sql .= "SELECT ";
        $sql .= "   f.id as id, ";
        $sql .= "   f.name as name, ";
        $sql .= "   f.picture as picture, ";
        $sql .= "   c.id as category_id, ";
        $sql .= "   c.name as category_name, ";
        $sql .= "   p1.days as fridge_days, ";
        $sql .= "   p2.days as freezer_days, ";
        $sql .= "   p3.days as room_days ";
        $sql .= "FROM foods f ";
        $sql .= "INNER JOIN categories c ";
        $sql .= "   ON f.category_id = c.id ";
        if ($categoryValue != "") {
            if ($categoryValue == "vegi") {
                $sql .= "   AND f.category_id = 1 ";
            } elseif ($categoryValue == "meat") {
                $sql .= "   AND f.category_id = 2 ";
            } elseif ($categoryValue == "daily") {
                $sql .= "   AND f.category_id = 3 ";
            } 
        }
        $sql .= "LEFT OUTER JOIN periods p1 ";
        $sql .= "   ON f.id = p1.food_id ";
        $sql .= "   AND p1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN periods p2 ";
        $sql .= "   ON f.id = p2.food_id ";
        $sql .= "   AND p2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN periods p3 ";
        $sql .= "   ON f.id = p3.food_id ";
        $sql .= "   AND p3.place_id = 3 ";
        if ($searchText != "") {
            $sql .= "WHERE f.name LIKE '%";
            $sql .= $searchText;
            $sql .= "%' ";
        }
        $sql .= "ORDER BY f.name";
        
        $result = $conn->query($sql);

        $conn->close();
    }
?>

<!doctype html>
<html lang="en">

    <!-- Head section -->
    <head>
        <title>Freshness</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
        <link rel="stylesheet" href="css/base.css">        
    </head>

    <!-- Body section -->
    <body id="mainBodyStyle">

        <!-- Navi -->
        <nav id="mainNav">
            <div>
                <a href="index.php" id="logoLabel">Freshness</a>
            </div>
        </nav>

        <!-- search header -->
        <div id="searchHeader">
            <a class="navButton" id="categoryButton">Category</a>
            <div id="or">Or</div>
            <form name="search1" method="post" action="index.php" id="searchBar">
                <input type="text" name="searchText" id="searchText" size="30" required>
                <input type="submit">
            </form>
        </div>
        <div class="spaceForHeader"></div>
        
        <!-- search panel (hiding) -->
        <div id="searchPanel">
            <a id="closeButton"><img src="images/close.png" alt="close"></a>
            <form name="search2" method="post" action="index.php">
                <table id="searchConditionalTable">
                    <tr class="verticalTop">
                        <td>
                            <input type="radio" name="category" class="categoryItem" value="vegi">Vegitables<br>
                            <input type="radio" name="category" class="categoryItem" value="meat">Meats<br>
                        </td>
                        <td>
                            <input type="radio" name="category" class="categoryItem" value="daily">Daily foods<br>
                            <input type="submit">
                        </td>
                    </tr>
                    <tr class="verticalTop">
                    </tr>
                </table>
            </form>
        </div>
        
        <!-- contents (results) -->
        <div id="searchContent">
        <?php if ($result->num_rows > 0) { ?>
            <table id="resultTable">
                <tr>
                    <td>Name</td>
                    <td>Picture</td>
                    <td>Refrigeraor</td>
                    <td>Freezer</td>
                    <td>Room</td>
                </tr>
                <?php while ($row = $result->fetch_assoc()) { ?>
                <tr>
                    <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} elseif ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>
                        <a href="content.php?id=<?php echo $row["id"] ?>" class="foodLink"><?php echo $row["name"] ?></a>
                    </td>
                    <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} elseif ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>
                        <img src="images/<?php echo $row["picture"] ?>" alt="<?php echo $row["picture"] ?>">
                    </td>
                    <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} elseif ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>
                        <?php if ($row["fridge_days"] != null) {echo $row["fridge_days"] . " days";} else {echo '-';} ?>
                    </td>
                    <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} elseif ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>
                        <?php if ($row["freezer_days"] != null) {echo $row["freezer_days"] . " days";} else {echo '-';} ?>
                    </td>
                    <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} elseif ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>
                        <?php if ($row["room_days"] != null) {echo $row["room_days"] . " days";} else {echo '-';} ?>
                    </td>
                </tr>
                <?php } ?>
            </table>
            <?php } ?>
        </div>
        
        <!-- footer -->
        <div id="spaceForFooter"></div>
        <div id="conFooter">
            <a href="aboutus.html" id="conAboutus">About Us</a>
            <p>Copyright &copy; 2017 Test company</p>
        </div>
                
    </body>
    
    <script> 
        $(document).ready(function() {
            
            // open the conditional panel
            $('#categoryButton').click(function() {
                $('#searchPanel').slideToggle();
            });
            
            // close the conditional panel
            $('#closeButton').click(function() {
                $('#searchPanel').slideToggle();
            });
            //$('.categoryItem').click(function() {
            //    $('#searchPanel').slideToggle();
            //});
            
        });
    </script>


</html>