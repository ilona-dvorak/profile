# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      puts 'What do you want to do ?'
      puts ' 1 - List all meals'
      puts ' 2 -  Add a meal'
      puts '3 - List all customers'
      puts '4 - Add a customer'
      puts '5 - Quit'

      user_action = gets.chomp.to_i

      case user_action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.create
      when 3 then @customers_controller.list
      when 4 then @customers_controller.add
      when 5 then quit!
      end
    end
  end

  private

  def quit!
    @running = false
  end
end
