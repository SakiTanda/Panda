$(document).ready(function() {
    // create random number (from 0 to 8)
    var rand = Math.floor( Math.random() * 9 );
    if (rand == 0) {
        document.getElementById("easter").setAttribute('class', 'easter1');
    } else if (rand == 4) {
        document.getElementById("easter").setAttribute('class', 'easter2');
    } else if (rand == 8) {
        document.getElementById("easter").setAttribute('class', 'easter3');
    }
    
});

function hideEaster(){
    $("#easter").fadeOut("slow");
}
setTimeout("hideEaster()", 1700);
