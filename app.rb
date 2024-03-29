require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './data/preservedata'
require 'json'

class App
  def initialize(books_array: [], person_array: [], rentals_array: [])
    @books_array = books_array
    @person_array = person_array
    @rentals_array = rentals_array
  end

  def book_list
    books_stored
  end

  def people_list
    display_person
  end

  def create_person
    puts 'Do you want to create a new student[1] or a new teacher[2]?'
    selection = gets.chomp.to_i
    if selection != 1 && selection != 2
      puts 'Invalid selection person could not be created'
    else
      puts 'Can we have a name for this person?'
      name = gets.chomp
      puts "Can we have this person's age?"
      age = gets.chomp.to_i
      id = Random.rand(1..1000)
      case selection
      when 1
        create_student(id, name, age)
      when 2
        create_teacher(id, name, age)
      end
    end
  end

  def create_book
    puts "Let's create a book"
    puts "Can we have this book's title?"
    title = gets.chomp
    puts "Can we have this book's author?"
    author = gets.chomp
    book = Book.new(title: title, author: author)
    @books_array.push(book)
    save_book(book)
    puts 'Book added successfully'
  end

  def create_rental
    if @books_array.empty?
      puts 'No books available for rent'
    else
      puts 'What book do you want to rent? (by title)'
      title = gets.chomp
      puts 'Can we know who wants to rent this book? (by ID)'
      id = gets.chomp.to_i
      puts 'What date the book was rented? (dd/mm/yyyy)'
      date = gets.chomp
      (book, person) = find_bookperson(title, id)
      rental = Rental.new(date: date, book: book, person: person)
      @rentals_array.push(rental)
      save_rental(rental.date, rental.book, rental.person, id)
      puts 'Rental added successfully'
    end
  end

  def rentals_list
    load_rental
  end

  def exit
    puts 'Thank you for using our services'
    abort
  end

  def load_app
    books_stored
  end

  private

  def create_student(id, name, age)
    puts 'Does this student has her/his parents permission to use the service?'
    puts '(y/n)'
    permission = gets.chomp
    case permission
    when 'y' || 'Y'
      parent_permission = true
    when 'n' || 'N'
      parent_permission = false
    else
      puts 'Invalid option, person could not be created'
      abort
    end
    puts 'What classroom does this student belongs to?'
    classroom = gets.chomp
    student = Student.new(id: id, name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    @person_array.push(student)
    save_student(student)
    print 'Student added successfully your ID is:'
    puts id
  end

  def create_teacher(id, name, age)
    puts "What is the teacher's specialization?"
    specialization = gets.chomp
    teacher = Teacher.new(id: id, name: name, age: age, specialization: specialization)
    @person_array.push(teacher)
    save_teacher(teacher)
    print 'Teacher added successfully your ID is:'
    puts id
  end

  def find_bookperson(title, id)
    @book = {}
    @person = {}

    @books_array.each do |bk|
      @book = bk if bk.title == title
    end
    @person_array.each do |persn|
      @person = persn if persn.id == id
    end
    [@book, @person]
  end

  def load_all
    books_stored
    display_person
    load_rental_onload
  end
end
