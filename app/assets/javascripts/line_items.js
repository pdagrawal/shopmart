$(document).ready(function(){
  $('#line_item_quantity').keyup(function(){
    if($('#line_item_quantity').val() == 0){  
      $('#quantity_error').html("Quantity can't be set to zero"); 
      return false;
    }else{
      $('#quantity_error').html("");
    }
  });
});