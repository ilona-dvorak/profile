class CustomersView

  def display_customers(customers) # `customers` is an array of `Customer` instances
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_user_for(attribute)
    puts "What is the #{attribute} of the customer?"
    return gets.chomp
  end
end
