function $(id){
	var element = document.getElementById(id);
	if(element== null)
		alert('program error: '+ id +'does not exist.');
	return element;
}

function arrowchange(id){
	
	if($(id).getAttribute('class')=="down") {
		//alert($(id).src.substr($(id).src.length-13, 4));
		$(id).src="images/arrow-up-3-24.png";
		$(id).setAttribute('class', 'up');
	} else {
		//alert($(id).src.substr($(id).src.length-13, 4));
		$(id).setAttribute('class', 'down');
		$(id).src="images/arrow-down-3-24.png";
	}
}