require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders_view = OrdersView.new
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @orders_view.display_all(orders)
  end

  def mark_as_delivered(employee)
    order_id = @orders_view.ask_for_id("order")
    order = @order_repository.find(order_id)
    order.deliver!
    @order_repository.save_csv
  end
end
