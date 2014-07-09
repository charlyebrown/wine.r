class Snooth
  attr_reader(:api_key)
  def initialize
    @api_key = 809h1gva4mkzi7v6q5np4o597krvxpklyp0poq3953cuuiip
  end

  def self.search(wine_name)
    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{@api_key}&q="
    JSON.parse(HTTParty.get(api_root + search_params))['wines']
  end

  def self.search_by_id(wine_id)
    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wine/?akey=#{@api_key}&id="
    result = JSON.parse(HTTParty.get(api_root + search_params))["wines"][0]
    wine_params = {name: result["name"], grape_blend: result["varietal"], region:
    result["region"], vineyard: result["winery"], description: result["wm_notes"],
    color: result["type"], image: result["image"]}
  end

end
