var _users  = document.getElementById('users'),
    UI      = {connected:false};

$(function(){
    // setup modal and show
    UI.loginModal   = $('#login').modal({
                        backdrop    : 'static',
                        keyboard    : false
                    });
    // setup rest of UI
    UI.body         = $('body');
    UI.username     = UI.loginModal.find('input');
    UI.u_parent     = UI.username.parents('.form-group');
    UI.message      = $('#message');
    UI.sendMessage  = $('#messageFrm');
    UI.leave        = $('#leave-room');

    // focus on login field
    UI.loginModal.on('shown.bs.modal',function(e){
        UI.username.val('').focus();
        _console.innerHTML = '';
        _users.innerHTML = '';
    });

    // leave room
    UI.leave.on('click',function(){
        // Unsibscribe
        ws.unsubscribe(AdvancedSocket.channels[0]);
        // change our AdvancedSocket to not run the Auto Connect feature
        AdvancedSocket.autoConnect = false;
        AdvancedSocket.checkConnection();
        UI.connected = false;
        // UI Updates
        UI.body.addClass('off');
        UI.loginModal.modal('show');
        return false;
    })

    // join room
    UI.loginModal.find('#loginFrm').submit(function(){
        var value = UI.username.val().trim();
        if (value === ''){
            UI.u_parent.addClass('has-error');
            UI.u_parent.find('.help-block').html('Please enter a username to login');
        } else {
            // set the username into our Client Info
            AdvancedSocket.clientInfo.username = value;
            // Authenticate User
            // On Success => AdvancedSocket.connected
            // On Fail    => AdvancedSocket.onError
            ws.authenticate(value, '');
        }
        return false;
    });

    // username blur
    UI.username.on('focus',function(){
       UI.u_parent.removeClass('has-error');
       UI.u_parent.find('.help-block').html('');
    });

    // send message
    UI.sendMessage.submit(function(){
        var value = UI.message.val().trim();
        if (value !== ''){
            ws.publish(AdvancedSocket.channels[0],value);
        }
        UI.message.val('').focus();
        return false;
    });
});

function receiveMessage(obj){
	
    if(typeof obj.data === 'object'){
        // process connected user menu
        
        _users.innerHTML = obj.data.DATA;
    } else if (obj.data !== 'FORCE-RECONNECT') {
        _console.innerHTML += obj.data;
        // animate the scroll
        $(_console).animate({scrollTop : _console.scrollHeight + 'px'},500);
    }
}


$.fn.easyNotify = function receiveMessage(options)
{
	

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

AdvancedSocket.connected = function (){
    // initial connect
    if (UI.connected === false){
        _console.innerHTML += '<div class="message clear"><div class="content">Welcome to the chat room ' + AdvancedSocket.clientInfo.username + '</div></div>';
        // UI Updates
        UI.username.val('');
        UI.body.removeClass('off');
        UI.loginModal.modal('hide');
        UI.message.focus();
        UI.leave.removeClass('hide');
        UI.connected = true;
    }
    AdvancedSocket.timerCount = AdvancedSocket.onlineTimer;
    AdvancedSocket.statusLabel.className = 'alert alert-success text-center';
    AdvancedSocket.statusLabel.innerHTML = 'We are connected!!!';
}

AdvancedSocket.onError = function(obj){
    // when an error occurs in the websocket
    if (obj.reqType === 'authenticate' && obj.code === -1){
        UI.u_parent.addClass('has-error');
        UI.u_parent.find('.help-block').html('Invalid User, please try again');
        UI.username.val('');
        AdvancedSocket.clientInfo.username = '';
    }
    AdvancedSocket.log('onError',obj);
};

