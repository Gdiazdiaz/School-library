class Person
  # Constructor
  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    # instance variables
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
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

  private

  def of_age?
    @age > 18
  end
end