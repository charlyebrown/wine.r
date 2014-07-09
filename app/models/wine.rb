class Wine < ActiveRecord::Base
  belongs_to :users
  validates :name, :vintage, :varietal, :region, presence: true
  validates :vintage, numericality: { only_integer: true}

  def self.add_wines(wine_list)
    wine_list.each do |wine_info|
      Wine.find_or_create_by!(code: wine_info["code"]) do |new_wine|
        new_wine.name = wine_info["name"]
        new_wine.vintage = wine_info["vintage"].to_i
        new_wine.varietal = wine_info["varietal"]
        new_wine.region = wine_info["region"]
        new_wine.vineyard = wine_info["vineyard"]
        new_wine.description = wine_info["description"]
        new_wine.color = wine_info["type"].blank? ? "unknown" : wine_info["type"]
        new_wine.code = wine_info["code"]
        new_wine.image = wine_info["image"]
      end
    end
  end
end
