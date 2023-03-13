class Options
  def display
    puts 'Please type the number of your selection'
    option = gets.chomp.to_i

    select(option)
  end

  def select(option)
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
      choice[option]
    else
      puts 'Invalid option'
    end
  end
end
