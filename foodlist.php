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
    $searchText = null;
    $categoryValue = null;
    if (isset($_POST['searchText'])) {
        $searchText = trim($_POST['searchText']);
    }
    if (isset($_POST['category'])) {
        $categoryValue = trim($_POST['category']);
    }    
    
    if ($connectflag) {
        // create SELECT query
        $sql = "";
        $sql .= "SELECT ";
        $sql .= "   f.food_id as id, ";
        $sql .= "   f.food_name as name, ";
        $sql .= "   f.picture as picture, ";
        $sql .= "   c.category_id as category_id, ";
        $sql .= "   c.category_name as category_name, ";
        $sql .= "   p1.days as fridge_days, ";
        $sql .= "   p2.days as freezer_days, ";
        $sql .= "   p3.days as room_days ";
        $sql .= "FROM foods f ";
        $sql .= "INNER JOIN categories c ";
        $sql .= "   ON f.category_id = c.category_id ";
        if ($categoryValue != "") {
            if ($categoryValue == "vege") {
                $sql .= "   AND f.category_id = 1 ";
            } elseif ($categoryValue == "meat") {
                $sql .= "   AND f.category_id = 2 ";
            } elseif ($categoryValue == "dairy") {
                $sql .= "   AND f.category_id = 3 ";
            } 
        }
        $sql .= "LEFT OUTER JOIN periods p1 ";
        $sql .= "   ON f.food_id = p1.food_id ";
        $sql .= "   AND p1.place_id = 1 ";
        $sql .= "LEFT OUTER JOIN periods p2 ";
        $sql .= "   ON f.food_id = p2.food_id ";
        $sql .= "   AND p2.place_id = 2 ";
        $sql .= "LEFT OUTER JOIN periods p3 ";
        $sql .= "   ON f.food_id = p3.food_id ";
        $sql .= "   AND p3.place_id = 3 ";
        if ($searchText != "") {
            $sql .= "WHERE f.food_name LIKE '%";
            $sql .= $searchText;
            $sql .= "%' ";
        }
        $sql .= "ORDER BY f.food_name";
        
        $result = $conn->query($sql);
        $result2 = $conn->query($sql);
        
        $conn->close();
    }
?>

<!DOCTYPE html>
<html lang = "en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="images/logo1.ico" />
  <title>Food List</title>
  <link rel="stylesheet" href="css/bootstrapxin.min.css">
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/xin.css">
  <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/xin.js"></script>
</head>

<body>

<div id="mainBodyStyleforFoodList">
		<!--change color by this id -->
		<div id="color_con_daily">
		<!-- Navi -->
        <nav id="mainNav" class="border_color_common">
			<table id="navCon">
				<tr>
					<td id="navLogo">
						<a href="index.html"><img src="images/logo6.png" alt="applogo"></a>
					</td>
					
					<td id="navSearch">
						<form name="search1" method="post" action="foodlist.php" id="searchBar">
							<input type="text" name="searchText" id="searchText" size="40" placeholder="Which food?">
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
	</div>
</div>

<div class="container" id="container-xin">

<!-- Body section -->
    


  <h2>Food List</h2> 
  
  
  <!--pc table -->  
<?php if ($result->num_rows > 0) { ?>
  <div class="table-responsive">
  <table class="table table-bordered" id="pctable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Picture</th>
        <th>Preservation</th>
		<th>Period</th>
      </tr>
    </thead>
    <tbody>
    
    <?php while ($row = $result->fetch_assoc()) { ?>
	  <tr class="<?php if ($row["category_id"] == 1){echo "pc-title-vege";} elseif ($row["category_id"] == 2){echo "pc-title-meat";} elseif ($row["category_id"] == 3){echo "pc-title-dairy";} ?>">
		<td rowspan=3><a href="content.php?id=<?php echo $row["id"] ?>"><?php echo $row["name"] ?></a></td>
        <td rowspan=3><a href="content.php?id=<?php echo $row["id"] ?>"><img class="img-responsive" src="food-images/<?php echo $row["picture"] ?>"></a></td>
        <td>Refrigerator</td> 
		<td><?php if ($row["fridge_days"] != null) {echo $row["fridge_days"] . " days";} else {echo '-';} ?></td>
	  </tr>
	  <tr class="<?php if ($row["category_id"] == 1){echo "pc-title-vege";} elseif ($row["category_id"] == 2){echo "pc-title-meat";} elseif ($row["category_id"] == 3){echo "pc-title-dairy";} ?>">
		<td>Freezer</td> 
		<td><?php if ($row["freezer_days"] != null) {echo $row["freezer_days"] . " days";} else {echo '-';} ?></td>
	  </tr>
	  <tr class="<?php if ($row["category_id"] == 1){echo "pc-title-vege";} elseif ($row["category_id"] == 2){echo "pc-title-meat";} elseif ($row["category_id"] == 3){echo "pc-title-dairy";} ?>">
		<td>Room temperature</td> 
		<td><?php if ($row["room_days"] != null) {echo $row["room_days"] . " days";} else {echo '-';} ?></td>
      </tr>
    <?php } ?>
    
    </tbody>
  </table>
  </div>
<?php } ?>
  
  <!--mobile version table -->
<?php if ($result2->num_rows > 0) { ?>
  <?php while ($row = $result2->fetch_assoc()) { ?>
  <div class="panel-group mobiletable" id="accordion" role="tablist" aria-multiselectable="true" mobiletable>
  <div class="panel panel-default">
    <div class="panel-heading <?php if ($row["category_id"] == 1){echo "titlevege";} elseif ($row["category_id"] == 2){echo "titlmeat";} elseif ($row["category_id"] == 3){echo "titldairy";} ?>" role="tab" id="<?php if ($row["category_id"] == 1){echo "titlevege";} elseif ($row["category_id"] == 2){echo "titlmeat";} elseif ($row["category_id"] == 3){echo "titldairy";} ?>">
      <h4 class="panel-title">
	  <div class="row">
	    <div class="col-xs-10 col-sm-10 col-md-10"><span class="titleword"><a href="content.php?id=<?php echo $row["id"] ?>"><?php echo $row["name"] ?></a></span></div>
		<div class="col-xs-2 col-sm-2 col-md-2"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $row["id"] ?>" aria-expanded="true" aria-controls="collapse<?php echo $row["id"] ?>">
          <!--arrow-->
		  <img src="images/arrow-down-3-24.png" class="down" id="arrow" onclick="arrowchange('arrow')">
        </a></div>
		</div>
      </h4>
    </div>
	<div id="collapse<?php echo $row["id"] ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="<?php if ($row["category_id"] == 1){echo "titlevege";} elseif ($row["category_id"] == 2){echo "titlmeat";} elseif ($row["category_id"] == 3){echo "titldairy";} ?>">
      <div class="panel-body">
        <div class="table-responsive">
			<table class="table table-bordered table-<?php if ($row["category_id"] == 1){echo "vege";} elseif ($row["category_id"] == 2){echo "meat";} elseif ($row["category_id"] == 3){echo "dairy";} ?>-color" id="mobiletable">
				<tbody>
				  <tr>
					<td rowspan=3><a href="content.php?id=<?php echo $row["id"] ?>"><img class="img-responsive" src="food-images/<?php echo $row["picture"] ?>"></a></td>
					<td>Refrigerator</td> 
					<td><?php if ($row["fridge_days"] != null) {echo $row["fridge_days"] . " days";} else {echo '-';} ?></td>
				  </tr>
				  <tr>
					<td>Freezer</td> 
					<td><?php if ($row["freezer_days"] != null) {echo $row["freezer_days"] . " days";} else {echo '-';} ?></td>
				  </tr>
				  <tr>
					<td>Room temperature</td> 
					<td><?php if ($row["room_days"] != null) {echo $row["room_days"] . " days";} else {echo '-';} ?></td>
				  </tr>
				  
				</tbody>
			  </table>
		</div>
	  </div>
    </div>
  </div>
 </div>
 <?php } ?>
<?php } ?>

</div>

		<!-- search panel (hiding) -->
        <form name="search2" method="post" action="foodlist.php" id="searchPanel">
			<a id="closeButton"><img src="images/close.png" alt="close"></a>
            <table id="searchConditionalTable">
				<tr class="verticalTop">
                    <td>
                        <input type="radio" name="category" id="cv1" value="vege"><label for="cv1">Vegetable</label><br>
                        <input type="radio" name="category" id="cm1" value="meat"><label for="cm1">Meat</label><br>
                    </td>
                    <td>
                        <input type="radio" name="category" id="cd1" value="dairy"><label for="cd1">Dairy Product</label><br>
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
							<input type="text" name="searchText" id="searchTextMobile" placeholder="Which food?">
							<input type="submit" id="searchButtonMobile" value="Search">
						</td>
					</tr>
				</table>
        </form>
        
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
		



<!--buttom-->	
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
            
            $('#info').click(function() {
                $('#test').slideToggle();
            });

            //Hidden search bar for mobile
            // open the conditional panel
            $('#search_Mobile').click(function() {
                $('#searchPanel2').slideToggle();
            });
            
            // close the conditional panel
            $('#closeButton2').click(function() {
                $('#searchPanel2').slideToggle();
            });
            $('#searchButtonMobile').click(function() {
                $('#searchPanel2').slideToggle();
            });

        });
        
    </script>
	
</body>
</html>