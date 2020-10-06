def burger(patty, sauce, topping)
  burger_components = ["bread", patty, sauce, topping, "bread"]
  if block_given?
    on_demand_patty = yield(patty)
    burger_components = ["bread", on_demand_patty, sauce, topping, "bread"]
  end
  return burger_components
end
