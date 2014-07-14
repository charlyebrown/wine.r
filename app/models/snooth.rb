class Snooth

  def self.convert_price(price_choice)
    price_params = price_choice.to_i
    case price_params
      when 1
        price = "&xp=10"
      when 2
        price = "&mp=10&xp=20"
      when 3
        price = "&mp=20&xp=35"
      when 4
        price = "&mp=35&xp=50"
      when 5
        price = "&mp=50&xp=80"
      when 6
        price = "&mp=80"
      else
        price = ""
    end
  end

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
    price = Snooth.convert_price(search_price)
    search_params = wine_name.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{ENV["SNOOTH_API_KEY"]}&q="
    JSON.parse(HTTParty.get(api_root + search_params + price))['wines']
    end
  end
