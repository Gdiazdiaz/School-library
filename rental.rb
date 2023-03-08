class Rental
    def initialize(date: date)
        @date = date
        @books = []
        @rentals = []
    end

    attr_accessor :book
  book = Book.new

  attr_accessor :person
  person = Person.new

end