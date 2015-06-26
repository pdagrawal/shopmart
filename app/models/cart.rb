class Cart < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :products
end
