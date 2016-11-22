class Order < ApplicationRecord
  attr_accessor :cart
  has_many :order_details, dependent: :destroy
  belongs_to :user
  has_many :products, through: :order_details

  after_save :build_order_details

  enum status: [:waiting, :accepted]
  validates :address, presence: true

  private
  def build_order_details
    cart.items.each do |item|
      order_details.create product_id: item.product_id,
      quanty: item.quantity
    end
  end

end
