$(document).ready(function() {
  
  bindEvents();
});


function bindEvents() {

}

function loggedIn(response) {
  var token = response.authResponse.accessToken
  var user_id = response.authResponse.userID
  var login = $.ajax({
    url: '/login',
    type: 'POST',
    data: {token: token, user_id: user_id},
    dataType: 'JSON'
  })  
  login.done(showPhoto)
}

function showPhoto(e) {
  console.log('giggity')
}



