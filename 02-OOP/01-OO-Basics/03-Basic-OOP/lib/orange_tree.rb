class OrangeTree
  def initialize
    @dead = false
    @age = 0
    @height = 0
    @fruits = 0
    @pick_a_fruit = 0
  end
  attr_reader :age, :height
  attr_accessor :fruits

  def one_year_passes!
    @age += 1
    @dead = false
    @height += 1 unless @age > 10
    @fruits = 0
    if @age > 5 && age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    end
  end

  def dead?
    if @age <= 50
      @dead = false
    elsif @age > 50 && @age < 75
      [false, false, true].sample
    elsif @age >= 75 && @age < 100
      [true, true, false].sample
    elsif @age >= 100
      @dead = true
    end
  end

  def pick_a_fruit!
    @fruits -= 1 unless @fruits.zero?
  end
end
