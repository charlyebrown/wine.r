module SnoothFood

  def self.search_by_food(food, search_price, user_preferences)
    price = Price.convert(search_price)
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

    #converts score into search term
    case fscore
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
      q = "Champagne"
    end

    q = q.split.join('+')
    api_root = "http://api.snooth.com/wines/?akey=#{ENV["SNOOTH_API_KEY"]}&q="
    JSON.parse(HTTParty.get(api_root + "#{q}" + price))['wines']

  end
end
