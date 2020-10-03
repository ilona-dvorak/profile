require_relative "croupier"
# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
while players_answer != "no"
  puts "Card? 'y' or 'yes' to get a new card"
  players_answer = gets.chomp
  if players_answer.downcase == "y" || players_answer.downcase == "yes"
    puts "You beat the bank! You win."
  end
end
