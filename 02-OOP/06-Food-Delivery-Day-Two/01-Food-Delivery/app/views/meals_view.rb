class MealsView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - €#{meal.price}"
    end
  end

  def ask_user_for_name
    puts 'What is the name of the meal?'
    return gets.chomp
  end

  def ask_user_for_price
    puts 'What is the price of the meal?'
    return gets.chomp.to_i
  end
end
