class User < ApplicationRecord
  has_many :orders
  has_many :comments
  has_many :ratings
  has_many :products

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]
  enum role: [:user, :admin]

  mount_uploader :avatar, PictureUploader

  validates :name, presence: true, length: {maximum: 50}
  validates :chatwork_id, presence:true

  scope :search, ->keyword { where "name LIKE ?", "%#{keyword}%" }

  ratyrate_rater

  class << self
    def from_omniauth access_token
      data = access_token.info
      user = User.find_by email: data["email"]
      unless user
        password = Devise.friendly_token[0,20]
        user = User.create name: data["name"], email: data["email"],
          password: password, password_confirmation: password
      end
      user
    end
  end

end
