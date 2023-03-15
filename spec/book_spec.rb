require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(author: 'Test Author', title: 'Test Title')
  end

  describe '#new' do
    it 'returns a new object' do
      @book.should be_an_instance_of Book
    end
  end
end
