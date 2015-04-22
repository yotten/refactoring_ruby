require './movie'

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = [] 
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      this_amount = amount_for(element)

      frequent_renter_points += 1
      if (element.movie.price_code == Movie::NEW_RELEASE) && (element.days_rented > 1)
        frequent_renter_points += 1
      end

      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount 
    end

    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result 
  end

  def amount_for(rental)
    ret = 0 

    case rental.movie.price_code
    when Movie::REGULAR
      ret += 2
      ret += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
    when Movie::NEW_RELEASE
      ret += rental.days_rented * 3
    when Movie::CHILDRENS
      ret += 1.5
      ret += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
      ret =ret.to_i if ret == ret.to_i
    end

    ret 
  end
end
