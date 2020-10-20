class Restaurant
  def initialize(location, origin, ratings)
    @location = location
    @origin = origin
    @ratings = ratings
    @start = false
  end

  def start
    @start = true
  end
end
