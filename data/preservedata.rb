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

def save_student(student)
  student_obj = {
    id: student.id,
    name: student.name,
    age: student.age,
    parent_permission: student.parent_permission,
    classroom: student.classroom
  }

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
    id: teacher.id,
    name: teacher.name,
    age: teacher.age,
    specialization: teacher.specialization
  }

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
  file = File.open('./data/person.json')

  if File.empty?('./data/person.json')
    puts 'No people on our list'
  else
    persons = JSON.parse(File.read('./data/person.json'))
    persons.each do |person|
      if person['type'] == 'Student'
        student = Student.new(id: person['id'], name: person['name'], age: person['age'], classroom: person['classroom'])
        @person_array << student
      else teacher = Teacher.new(id: person['id'], name: person['name'], age: person['age'], specialization: person['specialization'])
        @person_array << teacher
    end
  end
  end
  file.close
  puts "People on our list"
  @person_array.each do |person| 
    puts "Name: #{person.name}, Age: #{person.age}"
  end
  puts "That's all the people on our list"
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


