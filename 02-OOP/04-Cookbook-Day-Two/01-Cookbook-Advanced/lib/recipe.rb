class Recipe
attr_reader :name, :description, :prep_time, :rating

def initialize(name, description, prep_time, rating)
@name = name
@description = description
@prep_time = prep_time
@rating = rating
end
def prep_time?
@prep_time
end
def mark_as_done
@done = true
end
end
