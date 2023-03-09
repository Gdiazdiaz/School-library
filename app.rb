require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
    def book_list
        if Book.size
            puts "No existing books"
        else 
            Book.each do |book|
                puts "Title: #{book.title}, Author: #{book.author}"
            end
            puts "That's allwe have =)"
        end
    end

    def people_list
        if Person.size
            puts "No people on our list"
        else 
            Person.each do |person|
                puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
            end
            puts "That's everybody"
        end
    end

    def create_person
        puts "Do you want to create a new student[1] or a new teacher[2]?"
        selection = gets.chomp.to_i
        if selection != 1 && !=2
            puts "Invalid selection person could not be created"
        else
            puts "Can we have a name for this person?"
            name = gets.chomp
            puts "Can we have this person's age?"
            age = gets.chomp.to_i
            case selection
            when 1
            puts "Does this student has her/his parents permission to use the service?"
            puts "(y/n)"
            permission = gets.chomp
            case permission
            when 'y' || 'Y'
                parent_permission = true
            when 'n' || 'N'
                parent_permission = false
            else
                puts 'Invalid option, person could not be created'
            end
            puts "What classroom does this student belongs to?"
            classroom = gets.chomp
            id = (0..16).to_a.map{ |a| rand(16).to_s(16) }.join
            Student.new(id: id, name: name, age: age, parent_permission: parent_permission, classroom: classroom)
            puts "Student added successfully"
            when 2
            puts "What is the teacher's specialization?"
            specialization = gets.chomp
            id = (0..16).to_a.map{ |a| rand(16).to_s(16) }.join
            Teacher.new(id: id, name: name, age: age, specialization: specialization)
            puts "Teacher added successfully"
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
        puts "Book added successfully"
    end

    def exit
        puts "Thank you for using our services"
        abort
    end
end