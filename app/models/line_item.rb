class LineItem < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :cart
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true, format: { with: /\A([1-9]{1}[0-9]{0,3})\z/ , message: ": Enter valid quantity"}
end
