class OrdersView
  def ask_user_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} must be delivered by #{order.employee.username} to #{order.customer.name}."
    end
  end
end
