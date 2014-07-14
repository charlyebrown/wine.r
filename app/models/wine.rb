class Wine < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :name, :vintage, presence: true
  validates :vintage, numericality: { only_integer: true}
  validates :code, uniqueness: true

  def self.add_wines(wine_list)
    wine_list.each do |wine_info|
      Wine.find_or_create_by!(code: wine_info["code"]) do |new_wine|
        new_wine.name = wine_info["name"]
        new_wine.vintage = wine_info["vintage"].to_i
        new_wine.varietal = wine_info["varietal"].blank? ? "unknown" : wine_info["varietal"]
        new_wine.region = wine_info["region"]
        new_wine.vineyard = wine_info["vineyard"]
        new_wine.color = wine_info["type"].blank? ? "unknown" : wine_info["type"]
        new_wine.code = wine_info["code"]
        new_wine.image = wine_info["image"]
        new_wine.price = wine_info["price"].to_f

        #making a second API call to get the wine-maker's description
        api_root = "http://api.snooth.com/wine/?akey=#{ENV["SNOOTH_API_KEY"]}&id="
        new_wine.description = JSON.parse(HTTParty.get(api_root + new_wine.code))["wines"][0]["wm_notes"]
      end
    end
  end
end
