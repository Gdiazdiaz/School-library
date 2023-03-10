class Rental
  def initialize(date:, book:, person:)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  attr_accessor :book, :person, :date

  def self.size
    ObjectSpace.each_object(self).to_a
  end
end
