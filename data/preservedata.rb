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

  if File.empty?('./data/book.json')
    'Please add some books.  No books available.'
  else
    books = JSON.parse(File.read('./data/book.json'))
    books.each do |book|
      p "Book title #{book['title']}, from Author #{book['author']}"
    end
  end
  file.close
end

def save_rental(rental)
  rental_obj = {
    date: rental.date,
    book: rental.book,
    person: rental.person
  }

  file = File.open('./data/rental.json')

  if file.read.empty?
    rental = [rental_obj]
    'There are no rented books yet'
  else
    rental = JSON.parse(File.read('./data/rental.json'))
    rental << rental_obj
  end

  file.close

  myfile = File.open('./data/rental.json', 'w')
  myfile.write(JSON.pretty_generate(rental))
  myfile.close
end

def load_rental
  file = File.open('./data/rental.json')

  if File.empty?('./data/rental.json')
    puts 'Please add book to rent'
  else
    rentals = JSON.parse(File.read('./data/rental.json'))
    puts 'Library books available: '
    rentals.each do |rental|
      puts "Name: #{rental['person']}, Book: #{rental['book']}, Date: #{rental['date']}"
    end
  end
  file.close
end
