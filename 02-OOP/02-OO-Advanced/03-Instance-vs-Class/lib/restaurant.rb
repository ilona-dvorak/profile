class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @ratings = []
    @average_rating = 0
  end
  # TODO: implement .filter_by_city and #rate methods

  def rate(new_rate)
    @ratings << new_rate
    @average_rating = @ratings.reduce(:+).fdiv(@ratings.length)
  end

  def self.filter_by_city(restaurants, city)
    restaurants.filter { |restaurant| restaurant.city == city }
  end
end
