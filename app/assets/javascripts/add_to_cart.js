$(document).ready(function(){
	$('.add_product_to_cart').click(function(ev){
		var current_user = $('#user').val();
		if (current_user == ""){
			$("#message").html("Login before adding item to cart");
		}else{
			var ele_id = this.id
			var temp = ele_id.split('_')
			var product_id = temp[temp.length-1]
			var button = $(this);
			$.ajax({
			  method: "POST",
			  url: "/add_to_cart/"+product_id,
			  success: function(data){
	        $("#message").html("Product is successfully added to cart");
	        button.val('Added To Cart');
	        button.attr('disabled', true)
	      }
			});
		}
	});
});