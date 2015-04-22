require 'test/unit'
#require 'myarray'
require './customer.rb'
require './rental.rb'
require './movie.rb'

class TestCustomer < Test::Unit::TestCase
  def test_customer_new
    c = Customer.new("Mike")
    #puts c.statement
    assert_equal("Rental Record for Mike\n" +
           "Amount owed is 0\n" + 
           "You earned 0 frequent renter points", c.statement) 
  end

  def test_new_release_bonus
    c = Customer.new("Mike")
    m = Movie.new("Movie Title", Movie::NEW_RELEASE)
    r = Rental.new(m, 2)
    c.add_rental(r)
    #puts c.statement

    assert_equal("Rental Record for Mike\n" +
                 "\tMovie Title\t6\n\Amount owed is 6\n" + 
                 "You earned 2 frequent renter points", c.statement) 
  end

  def test_new_release_no_bonus
    c = Customer.new("Mike")
    m = Movie.new("Movie Title", Movie::NEW_RELEASE)
    r = Rental.new(m, 1)
    c.add_rental(r)
    #puts c.statement

    assert_equal("Rental Record for Mike\n" +
                 "\tMovie Title\t3\n\Amount owed is 3\n" + 
                 "You earned 1 frequent renter points", c.statement) 
  end

  def test_regular_3days
    c = Customer.new("Bob")
    m = Movie.new("Back to the", Movie::REGULAR)
    r = Rental.new(m, 3)
    c.add_rental(r) 

    assert_equal("Rental Record for Bob\n" +
                 "\tBack to the\t3.5\n\Amount owed is 3.5\n" +
                 "You earned 1 frequent renter points", c.statement)  
  end

  def test_regular_2days
    c = Customer.new("Tom")
    m = Movie.new("Terminator", Movie::REGULAR)
    r = Rental.new(m, 2)
    c.add_rental(r)

    assert_equal("Rental Record for Tom\n" +
                 "\tTerminator\t2\nAmount owed is 2\n" +
                 "You earned 1 frequent renter points", c.statement)
  end

  def test_childrens_4days
    c = Customer.new("Alexthunder")
    m = Movie.new("Dragon Ball", Movie::CHILDRENS)
    r = Rental.new(m, 4)
    c.add_rental(r)

    assert_equal("Rental Record for Alexthunder\n" +
                 "\tDragon Ball\t3\nAmount owed is 3\n" +
                 "You earned 1 frequent renter points", c.statement)
  end

  def test_childrens_3days
    c = Customer.new("Alan")
    m = Movie.new("Dragon Ball2", Movie::CHILDRENS)
    r = Rental.new(m, 3)
    c.add_rental(r)

    assert_equal("Rental Record for Alan\n" +
                 "\tDragon Ball2\t1.5\nAmount owed is 1.5\n" +
                 "You earned 1 frequent renter points", c.statement)
  end

  def test_all
    c = Customer.new("Mike")

    m = Movie.new("Movie Title", Movie::NEW_RELEASE)
    r = Rental.new(m, 2)
    c.add_rental(r)

    m = Movie.new("Movie Title2", Movie::NEW_RELEASE)
    r = Rental.new(m, 1)
    c.add_rental(r)

    m = Movie.new("Back to the", Movie::REGULAR)
    r = Rental.new(m, 3)
    c.add_rental(r)

    m = Movie.new("Terminator", Movie::REGULAR)
    r = Rental.new(m, 2)
    c.add_rental(r)

    m = Movie.new("Dragon Ball", Movie::CHILDRENS)
    r = Rental.new(m, 4)
    c.add_rental(r)

    m = Movie.new("Dragon Ball2", Movie::CHILDRENS)
    r = Rental.new(m, 3)
    c.add_rental(r)
    #puts c.statement
    assert_equal("Rental Record for Mike\n" +
                 "\tMovie Title\t6\n" +
                 "\tMovie Title2\t3\n" +
                 "\tBack to the\t3.5\n" +
                 "\tTerminator\t2\n" +
                 "\tDragon Ball\t3\n" +
                 "\tDragon Ball2\t1.5\n" +
                 "Amount owed is 19.0\n" +
                 "You earned 7 frequent renter points", c.statement)
  end
end

