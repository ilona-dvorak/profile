require_relative '../views/orders_view'
require_relative '../views/customers_view'
require_relative '../views/meals_view'
require_relative '../views/sessions_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @orders_view = OrdersView.new
    @customers_view = CustomersView.new
    @meals_view = MealsView.new
    @sessions_view = SessionsView.new
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
  end

  def add
    customer = acustomer
    meal = ameal
    employee = anemployee
    order = Order.new(customer: customer, meal: meal, employee: employee)
    @order_repo.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repo.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    my_undelivered_orders = @order_repo.my_undelivered_orders(employee)
    @orders_view.display(my_undelivered_orders)
    return my_undelivered_orders
  end

  def mark_as_delivered(employee)
    my_undelivered_orders = list_my_orders(employee)
    index = @orders_view.ask_user_for_index
    order = my_undelivered_orders[index]
    @order_repo.mark_as_delivered(order)
  end

  private

  def acustomer
    customers = @customer_repo.all
    @customers_view.display(customers)
    index = @orders_view.ask_user_for_index
    customer = customers[index]
    return customer
  end

  def ameal
    meals = @meal_repo.all
    @meals_view.display(meals)
    index = @orders_view.ask_user_for_index
    meal = meals[index]
    return meal
  end

  def anemployee
    delivery_guys = @employee_repo.all_delivery_guys
    @sessions_view.display(delivery_guys)
    index = @orders_view.ask_user_for_index
    employee = delivery_guys[index]
    return employee
  end
end
