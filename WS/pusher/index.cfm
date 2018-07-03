
<!---Logo and Label display --->
<h1 class="text-center">Metzger  <span class="glyphicon glyphicon-comment" aria-hidden="true"></span></h1>


<div class="container">


  <form action="" method="POST" role="form">
    <legend>How are you?</legend>

    <div class="form-group">
      <label for="">Title</label>
      <input type="text" class="form-control" id="title" placeholder="Write some title here" required>
      <label for="">Message</label>
   
      <textarea placeholder="Write some message here" id="message" class="form-control" onclick="pushNoti" required></textarea>
    </div>

    <button type="submit" class="btn btn-success"> <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Notify</button>
  </form>

</div>


<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script >
	
	(function($) {

  $.fn.easyNotify = function(options) {

    var settings = $.extend({
      title: "Notification",
      options: {
        body: "",
        icon: "",
        lang: 'pt-BR',
        onClose: "",
        onClick: "",
        onError: ""
      }
    }, options);

    this.init = function() {
    	
      var notify = this;
      if (!("Notification" in window)) {
       
      } else if (Notification.permission === "granted") {

        var notification = new Notification(settings.title, settings.options);

        notification.onclose = function() {
          if (typeof settings.options.onClose == 'function') {
            settings.options.onClose();
          }
        };

        notification.onclick = function() {
          if (typeof settings.options.onClick == 'function') {
            settings.options.onClick();
          }
        };

        notification.onerror = function() {
          if (typeof settings.options.onError == 'function') {
            settings.options.onError();
          }
        };

      } else if (Notification.permission !== 'denied') {
        Notification.requestPermission(function(permission) {
          if (permission === "granted") {
            notify.init();
          }

        });
      }

    };

    this.init();
    return this;
  };

}(jQuery));




var myClick = function() {
  alert('clicked!');
  console.log('clicked!');
};
var myClose = function() {
  alert('closed!');
  console.log('closed!');
};
var myError = function() {
  alert('Ops. Some error occurred!');
  console.log('Ops. Some error occurred!');
};
var imgBrasil = "https://ak8.picdn.net/shutterstock/videos/6651758/thumb/1.jpg";

$("form").submit(function(event) {
  event.preventDefault();

  var options = {
    title: $("#title").val(),
    options: {
      body: $("#message").val(),
      icon: imgBrasil,
      lang: 'pt-BR',
      onClick: myClick,
      onClose: myClose,
      onError: myError
    }
  };

  $("#easyNotify").easyNotify(options);
  
});


</script>