$(document).ready(function(){
  $('.clickable_column').click(function(){
    document.location.href=$(this).data("link");
  });
  $('.clickable_row').click(function(){
    document.location.href=$(this).data("link");
  });
})