require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i
      new_meal = Meal.new(id: id, name: name, price: price)
      @elements << new_meal
      @next_id = new_meal.id + 1
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
