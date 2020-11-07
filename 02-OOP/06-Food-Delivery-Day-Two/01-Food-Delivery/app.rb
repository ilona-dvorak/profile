# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

meals_csv_filepath? 'data/meals.csv'
meal_repository = MealReporitory.new(meals_csv_filepth)
meals_controller = MealsController.new(meal_repository)

customers_csv_filepath = 'data/customers.csv'
customer_repository = CustomerRepository.new(customers_csv_filepath)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)
router.run
