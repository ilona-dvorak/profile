class OrdersView
  def display_all(orders)
    orders.each do |order|
      puts "/#{order.customer.name}.*#{order.meal.name}/"
    end
  end

  def ask_for_id(something)
    puts "Please provide us with id of the #{something} you want to associate to this order:"
    gets.chomp.to_i
  end
end
