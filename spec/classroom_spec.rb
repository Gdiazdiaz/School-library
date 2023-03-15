require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @label = 'Test Label'
    @classroom = Classroom.new(label: 'Test Label')
    @student = Student.new(id: 27, name: 'Sofia', age: 45, classroom: @classroom)
  end

  describe '#new' do
    it 'returns a new object' do
      @classroom.should be_an_instance_of Classroom
    end

    it 'returns the label' do
      expect(@classroom.label).to eq @label
    end

    it 'test method add_rental' do
        @classroom.add_student(@student).should be_an_instance_of Student
      end
  end
end
