DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}
MEALS = {
  "Happy Meal" => ["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  calories = 0
  orders.map do |order|
    if MEALS.include? order
      MEALS[order].each do |item|
        calories += DISHES_CALORIES[item]
      end
    else
      calories += DISHES_CALORIES[order]
    end
  end
  calories
end
orders = ["French Fries", "Happy Meal", "Sprite", "Best Of McChicken"]
puts calories_counter(orders)
