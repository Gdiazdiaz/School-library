class Book
  attr_reader :rentals

  def initialize(author:, title:)
    @author = author
    @title = title
    @rentals = []
  end

  attr_accessor :author, :tittle

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
