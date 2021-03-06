class User < ActiveRecord::Base
  has_secure_password
  validates :username, :name, :birthday, :email, presence: true
  validates :username, uniqueness: true
  has_many  :wine_reviews, dependent: :destroy
  has_and_belongs_to_many :wines
end
