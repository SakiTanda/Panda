<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="shortcut icon" href="image/logo1.ico" />
  <title>Freshness</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/bootstrap.wei.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>



<div class="jumbotron">
  <div class="container text-center">
 
    <nav id="TitleArea">
            <div>
                <a href="index.html" id="logoIndex"><img class="img-responsive" src="images/logo9.png" alt="logo" width="680" height="160"></a>
            </div>
        </nav>
	<form name="search1" method="post" action="index.php" id="searchBar">
                <input type="text" name="searchText" id="searchText"  size="30" required>
                <input type="submit" value="Search" class="btn btn-primary">
            </form>
	
  </div>
</div>
  
<div class="container">  
  <h4 class="text-center">Or search by category:</h4>  
  <form action="index.php" method="post">
  <div class="row"> 
    <div class="col-xs-6 col-md-4 container_overlay">
               
        
		 <input type="image" src="images/meat.jpg" alt="SubmitImg" style="width:100%" id = "cMeat" class="img-responsive" name = "category" value = "meat">
		<a href="index.html"><div class="overlay">
		<div class="text_overlay">Meat</div>
		</div></a>
      </div>
   
    <div class="col-xs-6 col-md-4 container_overlay"> 
  
 <input type="image" src="images/vege.jpg" alt="SubmitImg" style="width:100%" id = "cVege" class="img-responsive" name = "category" value = "vege">
     <div class="overlay_1">
		<div class="text_overlay">Vege</div>
		</div>
    </div>
    <div class="col-xs-6 col-md-4 container_overlay"> 

       
 <input type="image" src="images/dairy.jpg" alt="SubmitImg" style="width:100%" id = "cDairy" class="img-responsive" name = "category" value = "dairy">
      <div class="overlay_2">
		<div class="text_overlay">Dairy</div>
		</div>
    </div>
  </div>
  </form>
</div><br>


<footer>
<div id="conFooter">
            <a href="#" id="conAboutus">About Us</a>
			<a href="https://www.facebook.com">
         <img src="images/fb.png" alt="fb">
         </a><a href="https://www.instagram.com/?hl=en">
         <img src="images/ig.png" alt="ig">
         </a>
            <p>Copyright &copy; 2017 Test company</p>
			
			
</div>
</footer>

</body>
</html>