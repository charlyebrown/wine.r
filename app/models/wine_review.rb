class WineReview < ActiveRecord::Base
  validates  :user_id, :wine_id, :rating, :title, presence: true
  validates  :rating, numericality: {only_integer: true}
  belongs_to :user
end
