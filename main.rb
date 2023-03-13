require_relative './app'
require_relative './entry_point'

class MainController
  def initialize
    @entry_point = EntryPoint.new
    @app = App.new
  end

  def execute
    puts @entry_point.menu
    puts 'Please type the number of your selection'
    option = gets.chomp.to_i

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
