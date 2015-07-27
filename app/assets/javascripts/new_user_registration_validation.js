$(document).ready(function(){
  var error = 0;
  $('#sign_up').click(function(){
    if($('#user_full_name').val().length < 4){  
      $('#full_name_error').html("Enter your full name"); 
      error++;
    }else{
      $('#full_name_error').html("");
    }
    if($('#user_email').val() == ""){
      $('#email_error').html("Enter email id");
      error++;
    }else{
      $('#email_error').html("");
    }
    if($('#user_password').val().length < 8){
      $('#password_error').html("Enter a valid password");
      error++;
    }else{
      $('#password_error').html("");
    }
    if($('#user_password_confirmation').val() == ""){
      $('#confirm_password_error').html("Please confirm password");
      error++;
    }else{
      $('#confirm_password_error').html("");
    }
    if($('#user_address').val() == ""){
      $('#address_error').html("Enter your address");
      error++;
    }else{
      $('#address_error').html("");
    }
    if( error == 0){
      return true;
    }else{
      return false;
    }
  });

  $('#user_full_name').keyup(function(){
    if($('#user_full_name').val().match(/^\s*$/)){
      $('#full_name_error').html("Enter your full name");
      return false;
    }else{
      $('#full_name_error').html("");
    }
    if($('#user_full_name').val().length < 4){  
      $('#full_name_error').html("Enter your full name"); 
      return false; 
    }else{
      $('#full_name_error').html("");
    }
  });
  $('#user_email').keyup(function(){
    if($('#user_email').val() == ""){
      $('#email_error').html("Enter email id");
      return false;
    }else{
      $('#email_error').html("");
    }
    if($('#user_email').val().match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/)){
      $('#email_error').html("");
    }else{
      $('#email_error').html("Invalid email format");
      return false;
    }
  });
  $('#user_password').keyup(function(){
    if($('#user_password').val().match(/^\s*$/)){
      $('#password_error').html("Please enter a valid password");
      return false;
    }else{
      $('#password_error').html("");
    }
    if($('#user_password').val().length < 8){
      $('#password_error').html("Enter minimum 8 characters password");  
      return false;  
    }else{
      $('#password_error').html("");
    }  
  });
  $('#user_password_confirmation').keyup(function(){
    if($('#user_password_confirmation').val() == ""){
      $('#confirm_password_error').html("Please confirm password");
      return false;
      }else{
        $('#confirm_password_error').html("");
    }
    if($('#user_password_confirmation').val() != $('#user_password').val()){
      $('#confirm_password_error').html("Password do not match");
      return false;
    }else{
      $('#confirm_password_error').html("");
    }               
  });
  $('#user_address').keyup(function(){
    if($('#user_address').val() == ""){
      $('#address_error').html("Enter your address");
      return false;
    }else{
      $('#address_error').html("");
    }
  });
});