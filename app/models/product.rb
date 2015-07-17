class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true, length: { minimum: 6 }, format: { with: /\A((\w)*(\s)?[a-zA-z]+(\s)?(\w)*)+\z/ , message: ": Enter valid Product Name"}
  validates :price, presence: true, format: { with: /[0-9]/ , message: ": Enter valid price"}
  validates :description, presence: true, length: { minimum: 15 }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "280x280>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
