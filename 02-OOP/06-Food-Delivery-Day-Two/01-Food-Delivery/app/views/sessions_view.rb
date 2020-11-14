class SessionsView
  def ask_user_for(something)
    puts "What's the #{something}?"
    return gets.chomp
  end

  def wrong_credentials
    puts "Sorry, incorrect username or password. Try again!"
  end

  def successful_login
    puts "You are successfully logged in!"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
end
