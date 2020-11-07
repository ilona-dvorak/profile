require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def sign_in
    username = @sessions_view.ask_for("username")
    password = @sessions_view.ask_for("password")
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @sessions_view.successfully_signed_in
      return employee
    else
      @sessions_view.wrong_credentials
      sign_in
    end
  end
end
