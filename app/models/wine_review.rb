class WineReview < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  validates :user_id, :wine_id, :rating, presence: true
  validates :rating, numericality: {only_integer: true}
end
