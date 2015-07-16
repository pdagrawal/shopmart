$(document).ready(function(){
  $('#line_item_quantity').keyup(function(){
    if($('#line_item_quantity').val().match(/^(0?[1-9]|[1-9][0-9])$/)){  
      $('#quantity_error').html(""); 
    }else{
      $('#quantity_error').html("Invalid Quantity");
      return false;
    }
  });
});