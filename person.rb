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
  attr_accessor :id

  # Get method
  attr_accessor :name

  # Get method
  attr_accessor :age

  attr_accessor :parent_permission

  def can_use_services?
    @parent_permission == true || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def self.size
    ObjectSpace.each_object(self).to_a
  end

  private

  def of_age?
    @age > 18
  end
end
