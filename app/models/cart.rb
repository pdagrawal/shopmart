class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def add_item_to_cart(product_id, cart, user)
  	line_item = cart.line_items.where(product_id: product_id).first
    if line_item.blank?
      line_item = LineItem.new(:cart_id => cart.id, :product_id => product_id, :quantity => 1)
      cart.line_items << line_item
    else
      line_item.quantity += 1
      line_item.save
	  end
    line_item.create_activity :create, owner: user if cart.save
  end
end
