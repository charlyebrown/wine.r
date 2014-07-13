class SnoothFood

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

  def self.search_by_food(food, search_price, user_preferences)
    price = SnoothFood.convert_price(search_price)
    pscore = SnoothFood.convert_user_preferences(user_preferences)
    #equates food item with a score
    case food
      when 1
        fscore = 10
      when 2
        fscore = 95
      when 3
        fscore = 85
      when 4
        fscore = 100
      when 5
        fscore = 100
      when 6
        fscore = 80
      when 7
        fscore = 80
      when 8
        fscore = 40
      when 9
        fscore = 40
      when 10
        fscore = 100
      else
        fscore = 0
    end

    score = ((pscore + fscore).fdiv(2))

    #converts score into search term
    case score
    when 1..10
      q = "Riesling"
    when 11..20
      q = "Pinot Grigio"
    when 21..30
      q = "Sauvignon Blanc"
    when 31..40
      q = "Chardonnay"
    when 41..50
      q = "Rose"
    when 51..60
      q = "Pinot Noir"
    when 61..70
      q = "Merlot"
    when 71..80
      q = "Chianti"
    when 81..90
      q = "Malbec"
    when 91..100
      q = "Cabernet Sauvignon"
    when 101..110
      q = "Zinfandel"
    else
      q = "Port"
    end

    q = q.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{ENV["SNOOTH_API_KEY"]}&q="
    JSON.parse(HTTParty.get(api_root + "#{q}" + price))['wines']

  end
end