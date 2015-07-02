class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
