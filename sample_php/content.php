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
    
    // get the food id (get parameter)
    $id = trim($_GET['id']);
    
    if ($connectflag) {
        // create SELECT query
        $sql = "";
        $sql .= "SELECT ";
        $sql .= "   f.name as name, ";
        $sql .= "   f.picture as picture, ";
        $sql .= "   c.id as category_id, ";
        $sql .= "   c.name as category_name, ";
        $sql .= "   p1.days as fridge_days, ";        
        $sql .= "   p2.days as freezer_days, ";
        $sql .= "   p3.days as room_days, ";
        $sql .= "   m1.detail as fridge_detail, ";
        $sql .= "   m1.picture as fridge_pic, ";
        $sql .= "   m2.detail as freezer_detail, ";
        $sql .= "   m2.picture as freezer_pic, ";
        $sql .= "   m3.detail as room_detail, ";
        $sql .= "   m3.picture as room_pic ";
        $sql .= "FROM foods f ";
        $sql .= "INNER JOIN categories c ";
        $sql .= "   ON f.category_id = c.id ";
        $sql .= "LEFT OUTER JOIN periods p1 ";
        $sql .= "   ON f.id = p1.food_id ";
        $sql .= "   AND p1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN periods p2 ";
        $sql .= "   ON f.id = p2.food_id ";
        $sql .= "   AND p2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN periods p3 ";
        $sql .= "   ON f.id = p3.food_id ";
        $sql .= "   AND p3.place_id = 3 ";
        $sql .= "LEFT OUTER JOIN methods m1 ";
        $sql .= "   ON f.id = m1.food_id ";
        $sql .= "   AND m1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN methods m2 ";
        $sql .= "   ON f.id = m2.food_id ";
        $sql .= "   AND m2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN methods m3 ";
        $sql .= "   ON f.id = m3.food_id ";
        $sql .= "   AND m3.place_id = 3 ";
        $sql .= "WHERE f.id = ";
        $sql .= $id;
        
        $result = $conn->query($sql);
        if ($result->num_rows == 0) {
            echo('Error: No such data.');
        } else {
            $row = $result->fetch_assoc();
        }

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

        <div class="spaceForNav"></div>
                
        <!-- contents -->
        <div id="foodContent">
            <?php if ($row["category_id"] == 1) { ?>
            <div id="vegiContent">
            <?php } else if ($row["category_id"] == 2) { ?>
            <div id="meatContent">
            <?php } else { ?>
            <div id="dailyContent">
            <?php } ?>
                <!-- title -->
                <div id="foodTitle"><?php echo $row["name"] ?></div>
                <!-- summary table -->
                <table id="resultTable">
                    <tr>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>Place</td>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>Preservation Period</td>
                    </tr>
                    <?php if ($row["fridge_days"] != null) { ?>
                    <tr>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>Refrigerator</td>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>><?php echo $row["fridge_days"] ?> days</td>
                    </tr>
                    <?PHP } ?>
                    <?php if ($row["room_days"] != null) { ?>
                    <tr>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>Room temperature</td>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>><?php echo $row["room_days"] ?> days</td>
                    </tr>
                    <?PHP } ?>
                    <?php if ($row["freezer_days"] != null) { ?>
                    <tr>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>>Freezer</td>
                        <td <?php if ($row["category_id"] == 2){echo "class='tdMeat'";} if ($row["category_id"] == 3){echo "class='tdDaily'";} ?>><?php echo $row["freezer_days"] ?> days</td>
                    </tr>
                    <?PHP } ?>
                </table>
                <!-- preservation method -->
                <div class="foodHeader">Preservation Method</div>
                <table id="methodTable">
                    <?php if ($row["fridge_days"] != null) { ?>
                    <tr>
                        <td colspan="2" class="methodHeader">
                            Refrigerator
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="images/<?php echo $row["fridge_pic"] ?>" alt="<?php echo $row["fridge_pic"] ?>">
                        </td>
                        <td>
                            <?php echo nl2br($row["fridge_detail"]) ?>
                        </td>
                    </tr>
                    <?PHP } ?>
                    <?php if ($row["room_days"] != null) { ?>
                    <tr>
                        <td colspan="2" class="methodHeader">
                            Room temperature
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="images/<?php echo $row["room_pic"] ?>" alt="<?php echo $row["room_pic"] ?>">
                        </td>
                        <td>
                            <?php echo nl2br($row["room_detail"]) ?>
                        </td>
                    </tr>
                    <?PHP } ?>
                    <?php if ($row["freezer_days"] != null) { ?>
                    <tr>
                        <td colspan="2" class="methodHeader">
                            Freezer
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="images/<?php echo $row["freezer_pic"] ?>" alt="<?php echo $row["freezer_pic"] ?>">
                        </td>
                        <td>
                            <?php echo nl2br($row["freezer_detail"]) ?>
                        </td>
                    </tr>
                    <?PHP } ?>
                </table>
            </div>
        </div>
        
        <!-- footer -->
        <div id="spaceForFooter">
        </div>
        <div id="conFooter">
            <a href="aboutus.html" id="conAboutus">About Us</a>
            <p>Copyright &copy; 2017 Test company</p>
        </div>
                
    </body>
    
    <script>
        $(document).ready(function() {
            
            // chenge the color
            <?php if ($row["category_id"] == 2){ ?>
            $('#resultTable tr:nth-of-type(1) td').css('color', '#D94720');
            $('.methodHeader').css('background-color', '#D94720');
            <?php } ?>
            <?php if ($row["category_id"] == 3){ ?>
            $('#resultTable tr:nth-of-type(1) td').css('color', '#FBAB20');
            $('.methodHeader').css('background-color', '#FBAB20');
            <?php } ?>
            
        });
            
    </script>

</html>