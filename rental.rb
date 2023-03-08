class Rental
  def initialize(date:)
    @date = date
    @books = []
    @rentals = []
  end

  attr_accessor :book, :person
end
