class Wine < ActiveRecord::Base
  belongs_to :users
  validates :name, :vintage, :varietal, :region, :color, presence: true
  validates :vintage, numericality: { only_integer: true}
end
