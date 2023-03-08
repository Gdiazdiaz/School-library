class Book
  attr_reader :rentals

  def initialize(author:, title:)
    @author = author
    @title = title
    @rentals = []
  end

  attr_accessor :author, :tittle

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
