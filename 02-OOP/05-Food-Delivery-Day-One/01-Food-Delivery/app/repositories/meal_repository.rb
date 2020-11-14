require_relative "../models/meal"
require 'csv'
class MealRepository
  def initialize(csv_filepath)
    @csv_file = csv_filepath
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(new_meal)
    new_meal.id = @next_id
    @meals << new_meal
    @next_id += 1
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |food|
        csv << [food.id, food.name, food.price]
      end
    end
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end


  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
      @next_id = row[:id] + 1
    end
  end
end
