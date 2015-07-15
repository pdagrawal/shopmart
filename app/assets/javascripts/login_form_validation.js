$(document).ready(function() {
  var error = 0 ;
  $('#login').click(function(){
    if($('#user_email').val() == ""){
      $('#email_error').html("Enter email id");
      error++;
    }else{
      $('#email_error').html("");
    }
    if($('#user_password').val().length < 8){
      $('#password_error').html("Enter password");
      error++;    
    }else{
      $('#password_error').html("");
    }
    if( error == 0 ){
      return true;
    }else{
      return false;
    }
  });
  $('#user_email').keyup(function(){
    if($('#user_email').val().match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/)){
      $('#email_error').html("");
    }else{
      $('#email_error').html("Invalid email format");
      return false;
    }
  });
  
  $('#user_password').keyup(function(){
    if($('#user_password').val().length < 8){
      $('#password_error').html("password is short");  
      return false;  
    }else{
      $('#password_error').html("");
    } 
  }); 
});