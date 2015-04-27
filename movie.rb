class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code 
  end 

  def charge(days_rented)
    ret = 0
    case @price_code
    when REGULAR
      ret += 2
      ret += (days_rented - 2) * 1.5 if days_rented > 2      
    when NEW_RELEASE
      ret += days_rented * 3
    when CHILDRENS
      ret += 1.5
      ret += (days_rented - 3) * 1.5 if days_rented > 3
      ret =ret.to_i if ret == ret.to_i  
    end

    ret
  end

  def frequent_renter_points(days_rented)
    (price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1 
  end   
end
