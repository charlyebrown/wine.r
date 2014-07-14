module Snooth

  #equates user's preferences with a score
  def self.convert_user_preferences(preferences)
    pscore = 0
    case preferences
      when /sparkling/
        pscore = 5
      when /white/
        pscore = 10
      when /rose/
        pscore = 50
      when /red/
        pscore = 60
      when /bold/
        pscore = 90
      when /oak/
        pscore = 20
      when /dry/
        pscore = 10
      when /sweet/
        pscore = 100
      else
        pscore = 0
    end
  end

  def self.search(wine_name, search_price)
    return [] if wine_name.blank?
    price = Price.convert(search_price)
    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{ENV["SNOOTH_API_KEY"]}&q="
    JSON.parse(HTTParty.get(api_root + search_params + price))['wines']
    end
  end
