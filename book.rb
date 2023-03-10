class Book
  attr_reader :rentals

  def initialize(author:, title:)
    @author = author
    @title = title
    @rentals = []
  end

  attr_accessor :author, :title

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def self.size
    ObjectSpace.each_object(self).to_a
  end
end
