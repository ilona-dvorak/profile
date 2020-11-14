require 'nokogiri'
require 'open-uri'

class Controller
def initialize(cookbook, view)
# @cookbook = Cookbook.new
@cookbook = cookbook
# @view = View.new
@view = view
end

def list
# 1. ask the list form cookbook
recipes = @cookbook.all
# 2. print the list
@view.print_recipes(recipes)
end

def create
# 1. ask the name
name = @view.ask_recipe_name
# 2. ask the description
description = @view.ask_recipe_description
# 3. create instance of recipe
recipe = Recipe.new(name, description)
# 4. add to the cookbook
@cookbook.create(recipe)
end

def destroy
# 1. ask the recipe number
index = @view.ask_for_recipe_number
# 2. ask the cookcook to destroy
recipe = @cookbook.destroy(index)
@view.recipe_removed_message(recipe)
end

def search
keyword = @view.ask_for_keyword
url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}"
doc = Nokogiri::HTML(open(url))

recipes_array = []

doc.search('.recipe-card').first(5).each do |element|
name = element.search('.recipe-card__title').text.strip
description = element.search('.recipe-card__description').text.strip
recipes_array << Recipe.new(name, description)
end


@view.print_recipe_names(recipes_array)

index = @view.ask_for_recipe_number

recipe = recipes_array[index]

@view.print_import_recipe(recipe.name)

@cookbook.create(recipe)
end

def mark_as_done
# 0. Get the recipes from the cookbook
recipes = @cookbook.all
# 1. List all recipes
@view.print_recipe_names(recipes)
# 2. Ask user for input
index = @view.ask_for_recipe_number
# 3. Get the correct recipe
recipe = @cookbook.find(index)
# 4. Mark as done
recipe.mark_as_done
# 5. Save the cookbook
@cookbook.save_csv
# 6. Print out 'done'
@view.print_done
end
end
