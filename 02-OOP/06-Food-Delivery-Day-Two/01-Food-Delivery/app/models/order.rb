class Order
  attr_accessor :id
  attr_reader :customer, :meal, :employee

  def initialize(attrs = {})
    @id = attrs[:id]
    @customer = attrs[:customer]
    @meal = attrs[:meal]
    @employee = attrs[:employee]
    @delivered = attrs[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
