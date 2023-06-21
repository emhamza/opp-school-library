class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def book_rentals(person, date)
    Rental.new(date, self, person)
  end
end
