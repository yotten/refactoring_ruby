class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented  
  end 

  def charge
    ret = 0 

    case movie.price_code
    when Movie::REGULAR
      ret += 2
      ret += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      ret += days_rented * 3
    when Movie::CHILDRENS
      ret += 1.5
      ret += (days_rented - 3) * 1.5 if days_rented > 3
      ret =ret.to_i if ret == ret.to_i
    end

    ret
  end
end
