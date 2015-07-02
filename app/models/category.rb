class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates :category, presence: true, uniqueness: true
end
