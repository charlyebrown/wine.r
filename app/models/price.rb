module Price

  def self.convert(price_choice)
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

end
