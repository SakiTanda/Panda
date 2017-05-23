<!doctype html>
<html lang="en">

    <!-- Head section -->
    <head>
	<link rel="shortcut icon" href="images/logo1.ico" />
        <title>Freshness</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="js/panel.js"></script>
        <link rel="stylesheet" href="css/base.wei.css">
		
    </head>

    <!-- Body section -->
    <body id="mainBodyStyle">
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
        
     </div> 
	 
<div id= "container_top_1"></div>
<div class="text-center">
<?php

$to = "wxh52794@gmail.com";
$subject = "User Opinions";
$userreply="Freshness reply";
$email = $_REQUEST['email'];
$message = $_REQUEST['comments'];
$note = "Thanks for your opinion, we will contact you soon";
$headers = "From:$email";
$headers2="From:$to";
$sent = mail($to,$subject,$message,$headers);
$reply = mail($email,$userreply,$note,$headers2);
if($sent)
{print('<a href="http://xyz-online.xyz/index.html">Thank you for your opinion.Click here to go to the home page</a>');}
else
{print"We encountered an error sending your email";}

?>
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
      <div id="container_bot"></div>
        <!-- footer -->
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
                        <a href="contactus.html" id="conAboutus">Contact Us</a>
                    </td>
                </tr>
            </table>
        </div>
                
    </body>

</html>




