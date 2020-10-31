require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    name = @view.ask_user_for('name')
    description = @view.ask_user_for('description')
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    display_recipes
    index = @view.ask_user_for('index').to_i - 1
    @cookbook.remove_recipe(index)
  end

  def list
    display_recipes
  end

  private

  def display_recipes
    @view.display(recipes)
  end
end
