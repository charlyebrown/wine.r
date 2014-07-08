class Wine < ActiveRecord::Base
  belongs_to_many :users
  validates :name, :year, :grape_blend, :region, :color, presence: true
  validate :year, numericality: { only_integer: true}
end
