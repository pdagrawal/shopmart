$(document).ready(function(){
  var edit_error = 0;
  $('#update').click(function(){
    if($('#user_full_name').val().length < 4){  
      $('#edit_full_name_error').html("Enter your full name"); 
      edit_error++;
    }else{
      $('#edit_full_name_error').html("");
    }
    if($('#user_current_password').val().length < 8){
      $('#current_password_error').html("Enter your current password");
      edit_error++;
    }else{
      $('#current_password_error').html("");
    }
    if($('#user_address').val() == ""){
      $('#edit_address_error').html("Enter your address");
      edit_error++;
    }else{
      $('#edit_address_error').html("");
    }
    if( edit_error == 0){
      return true;
    }else{
      return false;
    }
  });

  $('#user_full_name').keyup(function(){
    if($('#user_full_name').val().match(/^\s*$/)){
      $('#edit_full_name_error').html("Enter a valid full name");
      return false;
    }else{
      $('#edit_full_name_error').html("");
    }
    if($('#user_full_name').val().length < 4){  
      $('#edit_full_name_error').html("Enter your full name"); 
      return false; 
    }else{
      $('#edit_full_name_error').html("");
    }
  });
  $('#user_current_password').keyup(function(){
    if($('#user_current_password').val().length < 8){
      $('#current_password_error').html("Enter your current password");
      error++;
    }else{
      $('#current_password_error').html("");
    } 
  });
  $('#user_password').keyup(function(){
    if($('#user_password').val() == ""){
      $('#new_password_error').html("");
    }else{
      if($('#user_password').val().match(/^\s*$/)){
        $('#new_password_error').html("Please enter a valid password");
        return false;
      }else{
        $('#new_password_error').html("");
      }
      if($('#user_password').val().length < 8){
        $('#new_password_error').html("Enter minimum 8 characters password");  
        return false;  
      }else{
        $('#new_password_error').html("");
      }
    }
  });
  $('#user_password_confirmation').keyup(function(){
    if($('#user_password').val() == ""){
      $('#new_password_confirmation_error').html("");
    }else{
      if($('#user_password_confirmation').val() != $('#user_password').val()){
        $('#new_password_confirmation_error').html("Password do not match");
        return false;
      }else{
        $('#new_password_confirmation_error').html("");
      }
    }
  });
  $('#user_mobile_no').keyup(function(){
    if($('#user_mobile_no').val() == ""){
      $('#mobile_no_error').html("");
    }else{
      if($('#user_mobile_no').val().match(/^[1-9]{1}[0-9]{9}$/)){
        $('#mobile_no_error').html("");
      }else{
        $('#mobile_no_error').html("Invalid mobile no ");
        return false;
      }
    }
  });
  $('#user_address').keyup(function(){
    if($('#user_address').val() == ""){
      $('#edit_address_error').html("Enter your address");
      return false;
    }else{
      if($('#user_address').val().length < 15){
        $('#edit_address_error').html("Address is too short");  
        return false;  
      }else{
        $('#edit_address_error').html("");
      }
    }
  });
  $('#user_pincode').keyup(function(){
    if($('#user_pincode').val() == ""){
      $('#pincode_error').html("");
    }else{
      if($('#user_pincode').val().match(/^\d{6}$/)){
        $('#pincode_error').html("");
      }else{
        $('#pincode_error').html("Enter Valid pincode");
        return false;
      }
    }
  });
  $('#user_state').keyup(function(){
    if($('#user_state').val() == ""){
      $('#state_error').html("");
    }else{
      if($('#user_state').val().length < 3){
        $('#state_error').html("Enter a valid state");  
        return false;  
      }else{
        $('#state_error').html("");
      }
    }
  });
});