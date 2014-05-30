$(document).ready(function() {
  
  bindEvents();
});


function bindEvents() {
  $(document).on('dragenter', '#left', hatedPhoto)
  $(document).on('dragenter', '#right', likedPhoto)
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
  $('h3').text('Swipe right if you like my photo, swipe left if you don\'t.')
  $('#status').text('')
  $('#status').append('<div id="left"></div><img src="'+e.photo+'" class="photo" id="img" draggable="true"><div id="right"></div>') 
  $('#img').removeClass('photo').addClass('spinin')
}

function hatedPhoto(e) {
  $('h3').text('Why didn\'t you like my photo? :(')
  var changePhoto = $.ajax({
    url: '/photo',
    type: 'post',
  })
  changePhoto.done(showPhoto)
}

function likedPhoto(e) {
  $('h3').text('Yay, you liked my photo! :)')
  var changePhoto = $.ajax({
    url: '/photo',
    type: 'post',
  })
  changePhoto.done(showPhoto)
}

function loggedOut() {
  $('#status').empty()
  $.ajax({
    url: '/logout',
    type: 'get'
  })
}




