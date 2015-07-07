class User < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	has_one :cart, dependent: :destroy
	has_many :products, through: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
