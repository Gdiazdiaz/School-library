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
    rental = Rental.new(date: date, person: self.name, book: book.title)
  end

  private

  def of_age?
    @age > 18
  end
end

sofia = Person.new(name: 'Sofia', age: 25, id: 125, parent_permission: true)
puts sofia.correct_name
