require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.5.3/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.5.3/String.html#method-i-chomp
puts "Type a student name: "
student_name = gets.chomp
student_list = []
student_list << student_name
while student_name != ""
  puts "Type another student name or press enter to finish: "
  student_name = gets.chomp
  student_list << student_name
end
student_list.delete("")
puts "Congratulations! Your Wagon has #{student_list.length} students:"
# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
student_sorted = wagon_sort(student_list)

puts "#{student_sorted[0..-2].join(', ')} and #{student_sorted[-1]} "
