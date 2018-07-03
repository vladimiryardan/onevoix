<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="js/notifier.js"></script>

<script >
	$(window).load(function(){  
    $.notifier({    
        "message":"Enter your notification message here",   //content to be shown in the notification bar
        "color1":"white",   //background color of the notification bar  
        "color2":"black",   //color of the text 
        "closeButton":"text",   //shows a textual close button rather than a cross sign button. 
        "delay":3,   //when to show the notification from trigger point (in seconds) 
     	"showAnimation": "slideDown"
    }); 
});

$(document).ready(function() {  
    $('#myDiv').click(function(){   
        $.notifier({    
            "message":"this is your notification"
        }); 
    }); 
});


</script>