function arrowchange(id){
	
	if(document.getElementById(id).getAttribute('class')=="down") {
		//alert($(id).src.substr($(id).src.length-13, 4));
		document.getElementById(id).src="images/arrow-up-3-24.png";
		document.getElementById(id).setAttribute('class', 'up');
	} else {
		//alert($(id).src.substr($(id).src.length-13, 4));
		document.getElementById(id).setAttribute('class', 'down');
		document.getElementById(id).src="images/arrow-down-3-24.png";
	}
}