require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    all_meals = @meal_repository.all
    @view.display(all_meals)
  end

  def add
    name = @view.ask_user_for('name')
    price = @view.ask_user_for('price').to_i
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end
end
