class Snooth

  def self.search_wines(wine_name)
    return [] if wine_name.blank?

    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{ENV["SNOOTH_API_KEY"]}&q="
    JSON.parse(HTTParty.get(api_root + search_params))['wines']
  end

  def self.search_by_id(wine_id)
    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wine/?akey=#{ENV["SNOOTH_API_KEY"]}&id="
    result = JSON.parse(HTTParty.get(api_root + search_params))["wines"][0]
    wine_params = {name: result["name"], grape_blend: result["varietal"], region:
    result["region"], vineyard: result["winery"], description: result["wm_notes"],
    color: result["type"], image: result["image"]}
  end

end
