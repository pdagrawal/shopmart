$(document).ready(function(){
	$('.add_product_to_cart').click(function(ev){
		var ele_id = this.id
		var temp = ele_id.split('_')
		var product_id = temp[temp.length-1]
		$.ajax({
		  method: "POST",
		  url: "/add_to_cart/"+product_id,
		  success: function(data){
        $("#message").html("Product is successfully added to cart");
      }
		});
	});
});