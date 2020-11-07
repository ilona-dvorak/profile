require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(order)
    next_id = @orders.empty? ? 1 : @orders.last.id + 1
    order.id = next_id
    @orders << order
  end

  def undelivered_orders
    @orders.reject do |order|
      order.delivered?
    end
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i) # INSTANCE
      order = Order.new(
        id: row[:id],
        delivered: row[:delivered],
        meal: meal,
        customer: customer,
        employee: employee
      )
      @orders << order
    end
    @next_id = @orders.any? ? @orders.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << Order.headers
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end
