$(document).ready(function(){
  $('.clickable_row').click(function(){
    document.location.href=$(this).data("link");
  });
})