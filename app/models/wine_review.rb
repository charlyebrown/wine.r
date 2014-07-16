class WineReview < ActiveRecord::Base
  validates  :user_id, :wine_id, :rating, :title, presence: true
  validates  :rating, numericality: {only_integer: true}
  validates_uniqueness_of :user_id, :scope => [:wine_id]
  belongs_to :user
end
