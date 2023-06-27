require_relative '../book'

describe Book do
  context 'When creating a new book' do
    it 'should have the correct title' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.title).to eq('Title')
    end

    it 'should have the correct author' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.author).to eq('Author')
    end

    it 'should have an empty rentals array' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.rentals).to be_empty
    end
  end
end
