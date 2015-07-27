class Product < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :category
  has_many :line_items, dependent: :destroy
  validates :name, presence: true, length: { minimum: 6 }, format: { with: /\A((\w)*(\s)?[a-zA-z]+(\s)?(\w)*)+\z/ , message: ": Enter valid Product Name"}
  validates :price, presence: true, format: { with: /[0-9]/ , message: ": Enter valid price"}
  validates :description, presence: true, length: { minimum: 15 }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "280x280>", :small => "100x100>" }
  validates_attachment :image, :presence => true, :content_type => { :content_type => /\Aimage\/.*\Z/ }
end
