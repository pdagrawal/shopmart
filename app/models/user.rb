class User < ActiveRecord::Base
  has_many :roles, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :products, through: :orders
  validates :full_name, presence: true, length: { minimum: 5 }, format: { with: /\A([a-zA-Z]{1}[a-z]{2,15}(\s)?){2,6}\z/, message: ": Enter valid name"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :address, presence: true, length: { minimum: 10 }
  validates :mobile_no, format: { with: /\A([1-9]{1}[0-9]{9})?\z/ , message: ": Invalid Mobile No"}, on: :update
  validates :pincode, format: { with: /\A(\d{6})?\z/ , message: ": Invalid Pincode "}, on: :update
end
