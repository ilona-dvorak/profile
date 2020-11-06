# get all the meals from the meal rep
# dispay meals using the method in our view
require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    all_meals = @meal_repository.all
    @view.display_meals(all_meals)
  end


  def add
    name = @view.ask_user_for_name
    price = @view.ask_user_for_price
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end
end
