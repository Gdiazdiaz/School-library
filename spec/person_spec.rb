require_relative '../person'

describe Person do
    before :each do
        @id = 01
        @name = 'Test Name'
        @age = 25
      @person = Person.new(id: @id, name: @name, age: @age, parent_permission: true)
    end
  
    describe '#new' do
      it 'returns a new object' do
        @person.should be_an_instance_of Person
      end

      it 'test method can_use_service?' do
        expect(@person.can_use_services?).to be true
      end

      it 'test method correct_name' do
        expect(@person.correct_name).to eq @name
      end
    end
    
  end