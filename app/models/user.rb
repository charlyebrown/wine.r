class User < ActiveRecord::Base
  has_secure_password
  validates :name, :birthday, :email, presence: true
  validates :username, uniqueness: true
  has_many  :wine_reviews, dependent: :destroy
  has_many  :wines
end
