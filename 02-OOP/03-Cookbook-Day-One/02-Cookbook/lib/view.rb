class View
  def ask_user_for(something)
    puts "What's the #{something} of the recipe?"
    return gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end
end
