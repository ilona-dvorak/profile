class View
def print_recipes(recipes)
recipes.each_with_index do |recipe, index|
done = recipe.done? ? 'x' : ' '
rating = !recipe.rating.nil? ? "(#{recipe.rating})" : ''
puts "#{index + 1}. [#{done}] #{recipe.name} #{rating} => #{recipe.description}"
end
end
def print_recipe_names(recipes)
recipes.each_with_index do |recipe, index|
puts "#{index + 1}. #{recipe.name}"
end
end
def ask_recipe_name
puts 'what is the recipe name?'
print '> '
gets.chomp
end
def ask_recipe_description
puts 'what is the recipe description?'
print '> '
gets.chomp
end
def ask_for_recipe_number
puts 'what is the recipe number?'
print '> '
gets.chomp.to_i - 1
end
def recipe_removed_message(recipe)
puts "The recipe '#{recipe.name}' is deleted!"
end
def ask_for_keyword
puts 'Type a keyword'
print '> '
gets.chomp
end
def print_import_recipe(name)
puts "Importing recipe '#{name}'..."
end
def print_done
puts "It's done!"
end
end
