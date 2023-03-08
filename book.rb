class Book
  attr_reader :rentals

  def initialize(author:, title:)
    @author = author
    @title = title
    @rentals = []
  end

  attr_accessor :author, :tittle
end
