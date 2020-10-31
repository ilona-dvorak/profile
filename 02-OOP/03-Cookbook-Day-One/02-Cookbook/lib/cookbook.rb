require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    loading_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    saving_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    saving_csv
  end

  def all
    return @recipes
  end

  private

  def saving_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def loading_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
