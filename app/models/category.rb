class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  validates :category_name, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A((\w)*(\s)?[a-zA-z]+(\s)?(\w)*)+\z/ , message: ": Enter valid Category Name"}
end
