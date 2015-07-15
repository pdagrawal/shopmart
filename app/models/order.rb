class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  validates :address, presence: true, length: { minimum: 10 }, format: { with: /\A((\w)*(\s)?[a-zA-z]+(\s)?(\w)*)+\z/ , message: ": Enter valid Address"}
end
