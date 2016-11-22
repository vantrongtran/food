class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :ratings
  has_many :orders, through: :order_details
  has_many :order_details

  enum types: [:origin, :suggest]

  mount_uploader :image, PictureUploader

  validates :name, presence: true, length: {maximum: 50}
  validates :category_id, presence: true
  validates :quanty, presence: true, inclusion: 1..100
  validates :price, presence: true, inclusion: 1000..100000

  scope :search_by_category, ->id {where category_id: id if id.present?}
  scope :search_by_name, ->keyword { where "name LIKE ?", "%#{keyword}%" }
  ratyrate_rateable "rating"
end
