# TODO: you can build your christmas list program here!

#require_relative "helpers"
require 'nokogiri'

filepath = "/Users/ilona/code/ilona-dvorak/fullstack-challenges/01-Ruby/06-Parsing/Reboot-01-Christmas-list/lib/result.html"
html_content = File.open(filepath)
doc = Nokogiri::HTML(html_content)
doc.search('.v2-listing-card .v2-listing-card__info .text-body').each do |element|
  puts element.text.strip
end

def display_product(product_list)

end



puts "Welcome to your Christmas List 🎄"
user_answer = nil
gifts = [
  { name: "plant", bought: false },
  { name: "backpack", bought: true },
]
until user_answer == "quit"
  puts "What would you like to do? [list, add, mark, delete, quit]"
  user_answer = gets.chomp
  if user_answer == "list"
    display_list(gifts)
  elsif user_answer == "add"
    puts "What would you like to add?"
    new_gift = gets.chomp
    gifts << { name: new_gift, bought: false }
    puts "You added #{new_gift} to your Christmas list"
    # gifts.push(new_gift)
  elsif user_answer == "mark"
    puts "Which item would you like to mark as bought? (pick a number)"
    display_list(gifts)
    user_choice_index = gets.chomp.to_i - 1
    # gifts[user_choice_index][:bought] = !gifts[user_choice_index][:bought]
    gifts[user_choice_index][:bought] = true
  elsif user_answer == "delete"
    puts "Which item would you like to delete? (pick a number)"
    display_list(gifts)
    delete_gift_index = gets.chomp.to_i - 1
    puts "You removed #{gifts[delete_gift_index][:name]} from your list"
    gifts.delete_at(delete_gift_index)
  elsif user_answer == "quit"
    puts "Goodbye"
  else
    puts "Invalid answer"
  end
end

# 22. Add a new action 'idea'
# 23. If the user chooses idea, ask what they are looking for
# 24. Get user input and store it in variable
# 25. (BEFORE) Always get results for 'jeans'
# 26. with curl command, download enitre website into your project
# 27. create a filepath variable and link it to results.html
# 28. Open the file
# 29. Build Nokogiri document from the file
# 30. Search for the specific selector
# 31. Iterate over all the results
# 32. Display each result in a nice way
