require_relative '../classroom'

describe Classroom do
  before :each do
    @label = 'Test Label'
    @classroom = Classroom.new(label: 'Test Label')
  end

  describe '#new' do
    it 'returns a new object' do
      @classroom.should be_an_instance_of Classroom
    end

    it 'returns the label' do
      expect(@classroom.label).to eq @label
    end
  end
end
