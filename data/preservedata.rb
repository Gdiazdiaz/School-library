require_relative '../book'
require 'json'

def save_book(book)
  book_obj = {
    title: book.title,
    author: book.author
  }

  file = File.open('./data/book.json')

  if file.read.empty?
    book = [book_obj]
  else
    book = JSON.parse(File.read('./data/book.json'))
    book << book_obj
  end

  file.close

  myfile = File.open('./data/book.json', 'w')
  myfile.write(JSON.pretty_generate(book))
  myfile.close
end

def books_stored
  file = File.open('./data/book.json')

  if file.empty?('./data/book.json')
    p 'Please add some books.  No books available.'
  else
    books = JSON.parse(File.read('./data/book.json'))
    books.each do |book|
      book = Book.new(book.title, book.author)
      @books << book
    end
  end
  file.close
  @books.each { |book| puts "Book title #{book.title} written by #{book.author}" } unless @books.empty?
end
