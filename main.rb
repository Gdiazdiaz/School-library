require_relative './app'
class EntryPoint
  puts 'Welcome to School Library App'

  def menu
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end

class MainController
  def initialize
    @entry_point = EntryPoint.new
    @app = App.new
  end

  def execute
    puts @entry_point.menu
    puts 'Please type the number of your selection'
    option = gets.chomp

    choice = {
      1 => 'book_list',
      2 => 'people_list',
      3 => 'create_person',
      4 => 'create_book',
      5 => 'create_rental',
      6 => 'rentals_list',
      7 => 'exit'
    }

    case option
    when 1..7
      @app.send(choice[option])
    else
      puts 'Invalid option'
    end
    execute
  end
end

main = MainController.new
main.execute
