class Rental
  def initialize(date:)
    @date = date
    @books = []
    @rentals = []
  end

  attr_accessor :book, :person

  def self.size
    ObjectSpace.each_object(self).to_a
  end
end
