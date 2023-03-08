class Book
    attr_reader :rentals
    def initialize(author: author, title: title)
        @author = author
        @title = title
        rentals = []
    end

    attr_accessor :author
    attr_accessor :tittle
end