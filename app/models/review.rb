class Review < ActiveRecord::Base
  belongs_to_many :wines
  belongs_to_many :users
  validates :user_id, :wine_id, :rating, presence: true
  validates :rating numericality: {only_integer: true}
end
