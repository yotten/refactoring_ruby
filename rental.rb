class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented  
  end 

  def charge
    return movie.charge(@days_rented) 
  end

  def frequent_renter_points
    movie.frequent_renter_points(@days_rented)
    #((movie.price_code == Movie::NEW_RELEASE) && (@days_rented > 1)) ? 2 : 1
  end
end
