require_relative './nameable'
class Person < Nameable
  attr_reader :rentals

  # Constructor
  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    # instance variables
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Get method
  attr_reader :id

  # Get method
  attr_reader :name

  # Get method
  attr_reader :age

  # Set method
  def name=(_name)
    @name
  end

  # Set method
  def age=(_age)
    @age
  end

  def can_use_services?
    @parent_permission == true || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  def of_age?
    @age > 18
  end
end
