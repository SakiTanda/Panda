        
        $(document).ready(function() {
            
            // open the conditional panel
            $('#categoryButton').click(function() {
                $('#searchPanel').slideToggle();
            });
            
            // close the conditional panel
            $('#closeButton').click(function() {
                $('#searchPanel').slideToggle();
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
        });
