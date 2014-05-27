$(document).ready(function() {
  bindEvents();
});


function bindEvents() {

}

function loggedIn(response) {
  debugger
  var token = response.authResponse.accessToken
  var login = $.ajax({
    url: '/login',
    type: 'POST',
    data: token.serialize()
  })  
  login.done(showPhoto)
}

function showPhoto(e) {
  console.log('giggity')
}



