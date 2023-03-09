require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def book_list
    if Book.size
      puts 'No existing books'
    else
      Book.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
      puts "That's allwe have =)"
    end
  end

  def people_list
    if Teacher.size && Book.size
      puts 'No people on our list'
    else
      Person.each do |person|
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Special: #{person.specialization}"
      end
      Student.each do |student|
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age},
        Parents-permission: #{student.parents_permission}, Classroom #{student.classroom}"
      end
      puts "That's everybody"
    end
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
      id = (0..16).to_a.map { |_a| rand(16).to_s(16) }.join
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
    Book.new(title: title, author: author)
    puts 'Book added successfully'
  end

  def create_rental
    if Book.size
      puts 'No books available for rent'
    else
      puts 'What book do you want to rent? (by title)'
      title = gets.chomp
      puts 'Can we know who wants to rent this book? (by ID)'
      id = gets.chomp
      puts 'What date the book was rented? (dd/mm/yyyy)'
      date = gets.chomp
      (book, person) = find_bookperson(title, id)
      Rental.new(date: date, person: Person[person], book: Book[book])
      puts 'Rental added successfully'
    end
  end

  def rentals_list
    if Rental.size
      puts 'No existing rentals'
    else
      Rental.each do |rental|
        puts "Book: #{rental.book}, Person: #{rental.person}, Date: #{rental.date}"
      end
      puts "That's allwe have =)"
    end
  end

  def exit
    puts 'Thank you for using our services'
    abort
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
    end
    puts 'What classroom does this student belongs to?'
    classroom = gets.chomp
    Student.new(id: id, name: name, age: age, parent_permission: parent_permission, classroom: classroom)
    puts 'Student added successfully'
  end

  def create_teacher(id, name, age)
    puts "What is the teacher's specialization?"
    specialization = gets.chomp
    Teacher.new(id: id, name: name, age: age, specialization: specialization)
    puts 'Teacher added successfully'
  end

  def find_bookperson(title, id)
    Book.size.each do |bk|
      bk if bk.title == title
    end
    Person.size.each do |persn|
      persn if persn.id == id
    end
    [bk, persn]
  end
end
