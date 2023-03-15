require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Rental do
  context 'instantiate rental' do
    book = Book.new(author: 'Test Author', title: 'Test Title')
    student = Student.new(id: 555, age: 21, classroom: 'red', name: 'Gio', parent_permission: true)
    rental = Rental.new(date: '12/12/2022', book: book, person: student)

    it 'creates Rental instance with new object' do
      rental.should be_an_instance_of Rental
    end

    it 'check for correct date' do
      rental.date.should eql '12/12/2022'
    end
  end
end
