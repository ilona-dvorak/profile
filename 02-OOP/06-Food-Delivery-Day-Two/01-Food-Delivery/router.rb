class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.log_in
    while @running
      if @employee.manager?
        print_manager_menu
        user_action = gets.chomp.to_i
        route_manager_action(user_action)
      else
        print_delivery_person_menu
        user_action = gets.chomp.to_i
        route_delivery_person_action(user_action)
      end
    end
  end

  private

  def print_manager_menu
    puts '------------------------'
    puts '--------- MENU ---------'
    puts '------------------------'
    puts 'What do you want to do?'
    puts '1 - List all meals'
    puts '2 - Add a meal'
    puts '3 - List all customers'
    puts '4 - Add a customer'
    puts '5 - List all undelivered orders'
    puts '6 - Add a new order'
    puts '7 - Quit'
  end

  def print_delivery_person_menu
    puts '------------------------'
    puts '--------- MENU ---------'
    puts '------------------------'
    puts 'What do you want to do?'
    puts '1 - List my undelivered orders'
    puts '2 - Mark an order as delivered'
    puts '3 - Quit'
  end

  def route_manager_action(user_action)
    case user_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 7 then quit!
    end
  end

  def route_delivery_person_action(user_action)
    case user_action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 3 then quit!
    end
  end

  def quit!
    @running = false
  end
end
