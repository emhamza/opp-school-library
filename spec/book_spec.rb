require_relative '../book'

describe Book do
  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:person_name) { 'John Doe' }
  let(:rental_date) { Date.new(2023, 6, 26) }
  let(:book) { Book.new(book_title, book_author) }
  let(:person) { double('Person', name: person_name) }

  describe '#book_rentals' do
    it 'creates a new Rental instance' do
      rental = book.book_rentals(person, rental_date)
      expect(rental).to be_instance_of(Rental)
    end

    it 'assigns the book and person to the Rental instance' do
      rental = book.book_rentals(person, rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book rentals array' do
      expect {
        book.book_rentals(person, rental_date)
      }.to change { book.rentals.length }.by(1)
    end
  end
end
