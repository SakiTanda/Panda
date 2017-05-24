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
        $sql .= "   f.food_name as name, ";
        $sql .= "   f.picture as picture, ";
        $sql .= "   f.detail as detail, ";
        $sql .= "   c.category_id as category_id, ";
        $sql .= "   c.category_name as category_name, ";
        $sql .= "   p1.days as fridge_days, ";        
        $sql .= "   p2.days as freezer_days, ";
        $sql .= "   p3.days as room_days, ";
        $sql .= "   m1.detail as fridge_detail, ";
        $sql .= "   m1.method_picture as fridge_pic, ";
        $sql .= "   m2.detail as freezer_detail, ";
        $sql .= "   m2.method_picture as freezer_pic, ";
        $sql .= "   m3.detail as room_detail, ";
        $sql .= "   m3.method_picture as room_pic ";
        $sql .= "FROM foods f ";
        $sql .= "INNER JOIN categories c ";
        $sql .= "   ON f.category_id = c.category_id ";
        $sql .= "LEFT OUTER JOIN periods p1 ";
        $sql .= "   ON f.food_id = p1.food_id ";
        $sql .= "   AND p1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN periods p2 ";
        $sql .= "   ON f.food_id = p2.food_id ";
        $sql .= "   AND p2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN periods p3 ";
        $sql .= "   ON f.food_id = p3.food_id ";
        $sql .= "   AND p3.place_id = 3 ";
        $sql .= "LEFT OUTER JOIN methods m1 ";
        $sql .= "   ON f.food_id = m1.food_id ";
        $sql .= "   AND m1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN methods m2 ";
        $sql .= "   ON f.food_id = m2.food_id ";
        $sql .= "   AND m2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN methods m3 ";
        $sql .= "   ON f.food_id = m3.food_id ";
        $sql .= "   AND m3.place_id = 3 ";
        $sql .= "WHERE f.food_id = ";
        $sql .= $id;
        
        $result = $conn->query($sql);
        if ($result->num_rows == 0) {
            echo('Error: No such data.');
        } else {
            $row = $result->fetch_assoc();
        }

        // create SELECT query for light bulb
        // fridge
        if ($row["fridge_days"] != null) {
            $sql_fridge = "";
            $sql_fridge .= "SELECT ";
            $sql_fridge .= "   t.detail as detail ";
            $sql_fridge .= "FROM temperatures t ";
            $sql_fridge .= "WHERE t.category_id = ";
            $sql_fridge .=    $row["category_id"];
            $sql_fridge .= "  AND t.place_id = 1";
            
            $result_fridge = $conn->query($sql_fridge);
            if ($result_fridge->num_rows == 0) {
                echo('Error: No such data about fridge.');
            } else {
                $row_fridge = $result_fridge->fetch_assoc();
            }
        }
        // freezer
        if ($row["freezer_days"] != null) {
            $sql_freezer = "";
            $sql_freezer .= "SELECT ";
            $sql_freezer .= "   t.detail as detail ";
            $sql_freezer .= "FROM temperatures t ";
            $sql_freezer .= "WHERE t.category_id = ";
            $sql_freezer .=    $row["category_id"];
            $sql_freezer .= "  AND t.place_id = 2";
            
            $result_freezer = $conn->query($sql_freezer);
            if ($result_freezer->num_rows == 0) {
                echo('Error: No such data about freezer.');
            } else {
                $row_freezer = $result_freezer->fetch_assoc();
            }
        }
        // room
        if ($row["room_days"] != null) {
            $sql_room = "";
            $sql_room .= "SELECT ";
            $sql_room .= "   t.detail as detail ";
            $sql_room .= "FROM temperatures t ";
            $sql_room .= "WHERE t.category_id = ";
            $sql_room .=    $row["category_id"];
            $sql_room .= "  AND t.place_id = 3";
            
            $result_room = $conn->query($sql_room);
            if ($result_room->num_rows == 0) {
                echo('Error: No such data about room.');
            } else {
                $row_room = $result_room->fetch_assoc();
            }
        }

        $conn->close();
        
    }
?>

<!doctype html>
<html lang="en">

    <!-- Head section -->
    <head>
		<link rel="shortcut icon" href="image/logo1.ico" />
		<link rel="shortcut icon" href="images/logo1.ico" />
		<link rel="shortcut icon" href="images/logo1.ico" /
        <title>Freshness</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="js/panel.js"></script>
        <script type="text/javascript" src="js/easter.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.balloon.js"></script>
        <link rel="stylesheet" href="css/base.css">
    </head>

    <!-- Body section -->
    <body id="mainBodyStyle">
		<!--change color by this id -->
		<div id="color_con_<?php if ($row["category_id"] == 2 || $row["category_id"] == 5 || $row["category_id"] == 8){echo "meat";} elseif ($row["category_id"] == 3){echo "daily";} else {echo "vege";} ?>">
        
		<!-- Navi -->
        <nav id="mainNav" class="border_color">
			<table id="navCon">
				<tr>
					<td id="navLogo">
						<a href="index.html"><img src="images/logo6.png" alt="applogo"></a>
					</td>
					
					<td id="navSearch">
						<form name="search1" method="post" action="foodlist.php" id="searchBar">
							<input type="text" name="searchText" id="searchText" size="40" placeholder="Which food?" required>
							<input type="submit" id="searchButton" value="Search">
						</form>
					</td>
					
					<td id="navCategory">
						<a id="categoryButton">Category</a>
						<a id="search_Mobile"><img src="images/glassicon.png" id="glassIcon_img" alt="glass_Icon"></a>
						
					</td>
				
				</tr>
					
						
			</table>
			
        </nav>
                    
        <!-- contents -->
        <div id="foodContent">
               
            <!-- easter -->
            <?php if ($row["detail"] != null) { ?>
            <div class="easterTitle">Congratulation</div>
            <div class="easterSubTitle">You can get special food infomation about <?php echo $row["category_name"]; ?>!!</div>
            <?php } ?>

           <!-- title -->
            <div id="foodTitle" class="color_set">
                <span><?php echo $row["name"] ?></span>
                <?php if ($row["detail"] != null) { ?>
                <div id="subTitleEaster"><?php echo $row["detail"] ?></div>
                <?php } ?>
            </div>
            
            <!-- preservation methods -->
            <!--<div id="conHeader" class="color_set">Preservation Methods</div>-->
            
            <table id="methodTable" class="letter_color">
                <?php if ($row["fridge_days"] != null) { ?>
                <tr>
                    <td colspan="2">
                        <div class="methodHeader letter_color tdcolor_set"><span>Refrigerator <span class="methodHeaderDays">: <?php echo $row["fridge_days"] ?> days</span></span>
							<a href="#" class="fridgeBaloon" title="<?php echo nl2br($row_fridge["detail"]) ?>"><img src="images/lightBulb.png"></a>
						</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdleft">
                        <img src="food-images/<?php echo $row["fridge_pic"] ?>" alt="method1">
                    </td>
                    <td class="tdright">
                        <div class="letter_color tdletter_size">
                            <?php echo nl2br($row["fridge_detail"]) ?>
                        </div>
                    </td>
                </tr>
                <?PHP } ?>
                
                <?php if ($row["room_days"] != null) { ?>
                <tr>
                    <td colspan="2">
                        <div class="methodHeader letter_color tdcolor_set"><span>Room temperature <span class="methodHeaderDays">: <?php echo $row["room_days"] ?> days</span></span>
							<a href="#" class="roomBaloon" title="<?php echo nl2br($row_room["detail"]) ?>"><img src="images/lightBulb.png"></a>
						</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdleft">
                        <img src="food-images/<?php echo $row["room_pic"] ?>" alt="method2">
                    </td>
                    <td class="tdright">
                        <div class="letter_color tdletter_size">
                            <?php echo nl2br($row["room_detail"]) ?>
                        </div>
                    </td>
                </tr>
                <?PHP } ?>
                
                <?php if ($row["freezer_days"] != null) { ?>
                <tr>
                    <td colspan="2">
                        <div class="methodHeader letter_color tdcolor_set"><span>Freezer <span class="methodHeaderDays">: <?php echo $row["freezer_days"] ?> days</span></span>
							<a href="#" class="freezerBaloon" title="<?php echo nl2br($row_freezer["detail"]) ?>"><img src="images/lightBulb.png"></a>
						</div>
                    </td>
                </tr>
                <tr>
                    <td class="tdleft">
                        <img src="food-images/<?php echo $row["freezer_pic"] ?>" alt="method2">
                    </td>
                    <td class="tdright">
                        <div class="letter_color tdletter_size">
                            <?php echo nl2br($row["freezer_detail"]) ?>
                        </div>
                    </td>
                </tr>
                <?PHP } ?>
                
            </table>
        </div>
     </div>   
	 
		<!-- search panel (hiding) -->
        <form name="search2" method="post" action="foodlist.php" id="searchPanel">
			<a id="closeButton"><img src="images/close.png" alt="close"></a>
            <table id="searchConditionalTable">
				<tr class="verticalTop">
                    <td>
                        <input type="radio" name="category" id="cv1" value="vege" required><label for="cv1">Vegetable</label><br>
                        <input type="radio" name="category" id="cm1" value="meat"><label for="cm1">Meat</label><br>
                    </td>
                    <td>
                        <input type="radio" name="category" id="cd1" value="dairy"><label for="cd1">Dairy</label><br>
						<input type="radio" name="category" id="ca1" value="all"><label for="ca1">All</label><br>
                    </td>
					<td id="tdSubmitButton">
						<div class="spaceForSearchPanel"></div>
						<input type="submit" id="searchSubmit" value="Search">
					</td>
                </tr>
            </table>
        </form>
		
		<!-- search bar (for mobile:hiding)-->
        <form name="search3" method="post" action="foodlist.php" id="searchPanel2">
			<a id="closeButton2"><img src="images/close.png" alt="close"></a><br>
				<table>
					<tr>
						<td>
							<input type="text" name="searchText" id="searchTextMobile" placeholder="Which food?" required>
							<input type="submit" id="searchButtonMobile" value="Search">
						</td>
					</tr>
				</table>
        </form>

        <!-- easter -->         
        <?php if ($row["detail"] == null) { ?>
        <div id="easter" class="easter0"><a href="content.php?id=24" id="easterPath"><img src="images/006-fruit.png" alt="easter"></a></div>
        <?php } else { ?>
        <div id="flower1" class="easter0"><img src="#" alt="flower1" id="specialImage1"></div>
        <div id="flower2" class="easter0"><img src="#" alt="flower2" id="specialImage2"></div>
        <div id="flower3" class="easter0"><img src="#" alt="flower3" id="specialImage3"></div>
        <?php } ?>
        
               <!-- footer -->
        <div class="spaceForFooter"></div>
        <div id="conFooter">
            <table id="footerTable">
                <tr>
                    <td>
                        <a href="aboutus.html" id="conAboutus">About</a>
                    </td>
                    <td>
                        <a href="affiliate.html" id="conAboutus">Affiliates</a>
                    </td>
                    <td>
                        <a href="aboutus.html" id="conAboutus">Contact Us</a>
                    </td>
                </tr>
            </table>
		</div>
                
    </body>
	
			<!--Jquery for popup baloon-->
			<script>
			$(function() {	
						$('.fridgeBaloon').balloon({
							tipSize: 20,
							position: "top",
							
							css: {
								width:'150px',
								border: 'solid 4px #5baec0',
								padding: '10px',
								fontSize: '18px',
								fontWeight: 'bold',
								backgroundColor: 'white',
								color: 'black',
								opacity:'1'
							}
						});
			});
			
			$(function() {	
						$('.roomBaloon').balloon({
							tipSize: 20,
							position: "top",
							
							css: {
								width:'150px',
								border: 'solid 4px #5baec0',
								padding: '10px',
								fontSize: '18px',
								fontWeight: 'bold',
								backgroundColor: 'white',
								color: 'black',
								opacity:'1'
							}
						});
			});
			$(function() {	
						$('.freezerBaloon').balloon({
							tipSize: 20,
							position: "top",
							
							css: {
								width:'150px',
								border: 'solid 4px #5baec0',
								padding: '10px',
								fontSize: '18px',
								fontWeight: 'bold',
								backgroundColor: 'white',
								color: 'black',
								opacity:'1'
							}
				});
			});
		</script>
		
		
    
    <?php if ($row["detail"] != null) { ?>
    <script>
        function initImage() {
            // get date
            var day = new Date();
            var month = day.getMonth() + 1;
            
            // spring
            if (month >= 3 && month <= 5) {
                document.getElementById("specialImage1").setAttribute('src', 'images/005-cherry-blossom.png');
                document.getElementById("specialImage2").setAttribute('src', 'images/001-animal.png');
                document.getElementById("specialImage3").setAttribute('src', 'images/004-poppy.png');
            }
            // summer
            if (month >= 6 && month <= 8) {
                document.getElementById("specialImage1").setAttribute('src', 'images/016-summer.png');
                document.getElementById("specialImage2").setAttribute('src', 'images/007-animals.png');
                document.getElementById("specialImage3").setAttribute('src', 'images/017-palm-tree.png');
            }
            // autumn
            if (month >= 9 && month <= 11) {
                document.getElementById("specialImage1").setAttribute('src', 'images/009-leaves.png');
                document.getElementById("specialImage2").setAttribute('src', 'images/005-mushrooms.png');
                document.getElementById("specialImage3").setAttribute('src', 'images/006-gardening-1.png');
            }
            // winter
            if (month == 12 || month <= 2) {
                document.getElementById("specialImage1").setAttribute('src', 'images/012-snowflake.png');
                document.getElementById("specialImage2").setAttribute('src', 'images/003-nature.png');
                document.getElementById("specialImage3").setAttribute('src', 'images/001-snowman.png');
            }
        }
        initImage();

        function openFlower1() {
            document.getElementById("flower1").setAttribute('class', 'flower1');
            $("#flower1").fadeIn("slow");
        }
        function openFlower2() {
            document.getElementById("flower2").setAttribute('class', 'easter3');
            $("#flower2").fadeIn("slow");
        }
        function openFlower3() {
            document.getElementById("flower3").setAttribute('class', 'easter2');
            $("#flower3").fadeIn("slow");
        }
        function hideFlower1(){
            $("#flower1").fadeOut("slow");
        }
        function hideFlower2(){
            $("#flower2").fadeOut("slow");
        }
        function hideFlower3(){
            $("#flower3").fadeOut("slow");
        }
        setTimeout("openFlower1()", 50);
        setTimeout("hideFlower1()", 550);
        setTimeout("openFlower2()", 150);
        setTimeout("hideFlower2()", 650);
        setTimeout("openFlower3()", 250);
        setTimeout("hideFlower3()", 850);
        
    </script>
    <?PHP } ?>
    
</html>