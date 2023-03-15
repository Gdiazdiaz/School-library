require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require 'json'

def save_book(book)
  book_obj = {
    title: book.title,
    author: book.author
  }

  File.new('./data/book.json', 'w+') unless File.exist?('./data/book.json')

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
  File.new('./data/book.json', 'w+') unless File.exist?('./data/book.json')
  file = File.open('./data/book.json')

  if File.empty?('./data/book.json')
    'Please add some books.  No books available.'
  else
    books = JSON.parse(File.read('./data/book.json'))
    puts 'Books on our list:'
    books.each do |book|
      book = Book.new(title: book['title'], author: book['author'])
      @books_array << book
    end
  end
  file.close
  @books_array.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

def save_student(student)
  student_obj = {
    type: 'student',
    id: student.id,
    name: student.name,
    age: student.age,
    parent_permission: student.parent_permission,
    classroom: student.classroom
  }

  File.new('./data/person.json', 'w+') unless File.exist?('./data/person.json')

  file = File.open('./data/person.json')

  if file.read.empty?
    person = [student_obj]
  else
    person = JSON.parse(File.read('./data/person.json'))
    person << student_obj
  end

  file.close

  myfile = File.open('./data/person.json', 'w')
  myfile.write(JSON.pretty_generate(person))
  myfile.close
end

def save_teacher(teacher)
  teacher_obj = {
    type: 'teacher',
    id: teacher.id,
    name: teacher.name,
    age: teacher.age,
    specialization: teacher.specialization
  }

  File.new('./data/person.json', 'w+') unless File.exist?('./data/person.json')
  file = File.open('./data/person.json')

  if file.read.empty?
    person = [teacher_obj]
  else
    person = JSON.parse(File.read('./data/person.json'))
    person << teacher_obj
  end

  file.close

  myfile = File.open('./data/person.json', 'w')
  myfile.write(JSON.pretty_generate(person))
  myfile.close
end

def display_person
  File.new('./data/person.json', 'w+') unless File.exist?('./data/person.json')
  file = File.open('./data/person.json')

  if File.empty?('./data/person.json')
    puts 'No people on our list'
  else
    persons = JSON.parse(File.read('./data/person.json'))
    persons.each do |person|
      if person['type'] == 'Student'
        display_students(person)
      else
        display_teachers(person)
      end
    end
  end
  file.close
  puts 'People on our list'
  @person_array.each do |person|
    puts "Name: #{person.name}, Age: #{person.age}"
  end
end

def display_students(person)
  student = Student.new(id: person['id'], name: person['name'], age: person['age'], classroom: person['classroom'])
  @person_array << student
end

def display_teachers(person)
  teacher = Teacher.new(id: person['id'], name: person['name'], age: person['age'],
                        specialization: person['specialization'])
  @person_array << teacher
end

def save_rental(date, book, person, personid)
  rental_obj = {
    date: date,
    book: book.title,
    person: person.name,
    personid: personid
  }

  File.new('./data/renta;.json', 'w+') unless File.exist?('./data/rental.json')
  file = File.open('./data/rental.json')

  if file.read.empty?
    rental = [rental_obj]
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
  File.new('./data/renta;.json', 'w+') unless File.exist?('./data/rental.json')
  file = File.open('./data/rental.json')

  if File.empty?('./data/rental.json')
    puts 'No books currently rented'
  else
    rentals = JSON.parse(File.read('./data/rental.json'))
    puts 'Can we have the ID of the person whose rentals you want to see? (by ID)'
    id = gets.chomp.to_i
    rentals.each do |rental|
      next unless id == rental['personid']

      renta = Rental.new(date: rental['date'], book: rental['book'], person: rental['person'])
      @rentals_array << renta
    end
  end
  file.close
  puts 'Rented books'
  @rentals_array.each do |renta|
    puts "Book: #{renta.book}, Person: #{renta.person}"
  end
end

def load_rental_onload
  File.new('./data/renta;.json', 'w+') unless File.exist?('./data/rental.json')
  file = File.open('./data/rental.json')

  if File.empty?('./data/rental.json')
    puts 'No books currently rented'
  else
    rentals = JSON.parse(File.read('./data/rental.json'))
    puts 'Rented books'
    rentals.each do |rental|
      puts "Book: #{rental['book']}, Person: #{rental['book']}"
      # renta = Rental.new(date: rental['date'], book: rental['book'], person: rental['person'])
      # @rentals_array << renta
    end
  end
  file.close
  # puts 'Rented books'
  # @rentals_array.each do |renta|

  # end
end
