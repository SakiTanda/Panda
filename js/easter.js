$(document).ready(function() {
    // create random number (from 0 to 5)
    var rand = Math.floor( Math.random() * 6 );
    if (rand == 0) {
        document.getElementById("easter").setAttribute('class', 'easter1');
    } else if (rand == 1) {
        document.getElementById("easter").setAttribute('class', 'easter2');
    } else if (rand == 2) {
        document.getElementById("easter").setAttribute('class', 'easter3');
    }
    
    // get date
    var day = new Date();
    var month = day.getMonth() + 1;

    // create random number (from 0 to 2)
    var rand2 = Math.floor( Math.random() * 3 );
    var easterTarget = document.getElementById('easterPath');
    
    //spring
    if (month >= 3 && month <= 5) {
        if (rand2 == 0) {
            easterTarget.href = "content.php?id=9";
        } else if (rand2 == 1) {
            easterTarget.href = "content.php?id=11";
        } else if (rand2 == 2) {
            easterTarget.href = "content.php?id=10";
        }
    }
    // summer
    if (month >= 6 && month <= 8) {
        easterTarget.href = "content.php?id=24";
    }
    // autumn
    if (month >= 9 && month <= 11) {
        easterTarget.href = "content.php?id=25";
    }
    // winter
    if (month == 12 || month <= 2) {
        easterTarget.href = "content.php?id=26";
    }
    
});

function hideEaster(){
    $("#easter").fadeOut("slow");
}
setTimeout("hideEaster()", 2000);
