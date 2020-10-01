require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "Nice day today"
message = gets.chomp
puts coach_answer_enhanced(message)
