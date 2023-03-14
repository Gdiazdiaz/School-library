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
