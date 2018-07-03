

  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyA3gJdECGwS_IGPis5VPkz_VgU_OPga-FA",
    authDomain: "forward2phone-b4166.firebaseapp.com",
    databaseURL: "https://forward2phone-b4166.firebaseio.com",
    projectId: "forward2phone-b4166",
    storageBucket: "forward2phone-b4166.appspot.com",
    messagingSenderId: "762261216450"
  };

  firebase.initializeApp(config);
  
  const messaging = firebase.messaging();
  messaging.requestPermission()
  .then(function()
  {
  	console.log('Have Permission');
  	return messaging.getToken();
  	
  })
  .then(function(token)
  {
  	console.log(token);
  })
  
  .catch(function(err)
  {
  	console.log('error occured');
  })
  
  messaging.onMessage(function(payload)
  {
  	console.log('onMessage: ', payload);
  })


