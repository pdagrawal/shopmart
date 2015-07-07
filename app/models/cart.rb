class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def add_item_to_cart(product_id, cart)
  	line_item = cart.line_items.where(product_id: product_id).first
    if line_item == nil
    	item = LineItem.create!(:cart_id => cart.id, :product_id => product_id, :quantity => 1)
      cart.line_items << item
      cart.save
    else
      line_item.quantity += 1
      line_item.save
	  end
    cart.save
  end
end
