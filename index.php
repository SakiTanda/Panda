<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="shortcut icon" href="image/logo1.ico" />
  <title>Freshness</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    
    
    /* Add a gray background color and some padding to the footer */
 
  </style>
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
    <div class="col-xs-6 col-md-4">
               
        
		 <input type="image" src="images/meat.jpg" alt="SubmitImg" style="width:100%" id = "cMeat" class="img-responsive" name = "category" value = "meat">
		<!--<img src="images/meat.jpg" class="img-responsive" style="width:100%" alt="Image" id = "cMeat">-->
      </div>
   
    <div class="col-xs-6 col-md-4"> 

        
 <input type="image" src="images/vege.jpg" alt="SubmitImg" style="width:100%" id = "cVege" class="img-responsive" name = "category" value = "vege">
     
    </div>
    <div class="col-xs-6 col-md-4"> 

       
 <input type="image" src="images/dairy.jpg" alt="SubmitImg" style="width:100%" id = "cDairy" class="img-responsive" name = "category" value = "dairy">
      
    </div>
  </div>
  </form>
</div><br>


<footer class="container-fluid text-center">
<div id="conFooter">
            <a href="#" id="conAboutus">About Us</a>
			
            <p>Copyright &copy; 2017 Test company</p>
</div>
</footer>

</body>
</html>