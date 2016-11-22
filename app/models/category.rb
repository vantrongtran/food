class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :description, length: {maximum: 200}
end
