class Rental
  def initialize(date:, book:, person:)
    @date = date
    @book = book
    @person = person
  end

  attr_accessor :book, :person, :date

  def self.size
    ObjectSpace.each_object(self).to_a
  end
end
