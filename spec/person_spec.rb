require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  before :each do
    @id = 0o1
    @name = 'Test Name'
    @age = 25
    @date = '12/12/12'
    @book = Book.new(title: 'The Great Gatsby', author: 'Scott Fitzgerald')
    @person = Person.new(id: @id, name: @name, age: @age, parent_permission: true)
  end

  describe '#new' do
    it 'returns a new object' do
      @person.should be_an_instance_of Person
    end

    it 'test id' do
      expect(@person.id).to eq @id
    end

    it 'test name' do
      expect(@person.name).to eq @name
    end

    it 'test age' do
      expect(@person.age).to eq @age
    end

    it 'test method can_use_service?' do
      expect(@person.can_use_services?).to be true
    end

    it 'test method correct_name' do
      expect(@person.correct_name).to eq @name
    end

    it 'test method add_rental' do
      @person.add_rental(@book, @date).should be_an_instance_of Rental
    end
  end
end
