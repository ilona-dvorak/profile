# TODO: you can build your calculator program here!
puts "Enter the fist number:"
first_number = gets.chomp.to_i
puts  "Enter the second number:"
second_number = gets.chomp.to_i
puts "Which operation [+][-][x][/] :"
operation = gets.chomp
user_answer = "Y"
while user_answer == "Y"

if operation == "+"
  result = first_number + second_number
  elseif operation == "-"
  result = first_number - second_number
 elseif operation == "x"
result = first_number * second_number
 elseif operation == "/"
result = first_number.to_f / second_number
else
  puts "Invalid entry"
end
puts  "Result: #{result}"
puts " Do you want to try again [Y] [N] ?"
user_answer = gets.chomp
else

end
# case statement
