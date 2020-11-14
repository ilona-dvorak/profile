def display_list(array)
  array.each_with_index do |item, index|
    # if item[:bought]
    #   status = "[x]"
    # else
    #   status = "[ ]"
    # end
    status = item[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1}. #{status} #{item[:name]}"
  end
end
