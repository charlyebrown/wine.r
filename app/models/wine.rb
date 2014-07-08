class Wine < ActiveRecord::Base
  belongs_to :users
  validates :name, :year, :grape_blend, :region, :color, presence: true
  validates :year, numericality: { only_integer: true}
end
