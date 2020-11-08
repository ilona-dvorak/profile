require_relative 'base_repository'
require 'csv'

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
  end

  def undelivered_orders
    @elements.select { |order| order.delivered? == false }
  end

  def my_undelivered_orders(current_employee)
    @elements.select { |order| order.employee == current_employee && order.delivered? == false }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      id = row[:id].to_i
      delivered = row[:delivered] == 'true'
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      order = Order.new(id: id, delivered: delivered, meal: meal, customer: customer, employee: employee)
      @elements << order
      @next_id += 1
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id delivered meal_id customer_id employee_id]
      @elements.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
