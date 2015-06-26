class Order < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :product
end
