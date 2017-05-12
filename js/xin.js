
function toggle(id){
	$('#collapse'+'-'+id).slideToggle();
		}

function arrowchange(id){
	console.log(id);
	if(document.getElementById(id).getAttribute('class')=="down") {
		document.getElementById(id).src="images/arrow-up-3-24.png";
		document.getElementById(id).setAttribute('class', 'up');
	} else {
		document.getElementById(id).setAttribute('class', 'down');
		document.getElementById(id).src="images/arrow-down-3-24.png";
	}
	toggle(id);
}


