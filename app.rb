require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_of_people
    puts 'List of people:'
    @people.each do |person|
      if person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, " \
             "Parent Permission: #{person.parent_permission}"
      end
    end
  end

  def create_teacher
    print "Teacher's Specialization: "
    specialization = gets.chomp
    print "Teacher's age: "
    age = gets.chomp.to_i
    print "Teacher's name: "
    name = gets.chomp

    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @people << teacher
    puts 'You have successfully registered a Teacher'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '

    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      student = Student.new(nil, age, name, parent_permission: false)
      @people << student
    when 'y'
      student = Student.new(nil, age, name, parent_permission: true)
      @people << student
    else
      'You have entered an invalid option'
    end

    puts 'You have successfully registered a Student'
  end

  def create_person
    print 'Do you want to create a new student (1) or teacher (2)? [input the number]: '
    selected_person_type = gets.chomp.to_i

    case selected_person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Created book successfully'
  end

  def create_rental
    puts 'Select a book from the following list of numbers: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i

    puts 'Select a person from the following list of numbers (not ID):'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} ID: #{person.id}"
    end
    selected_person = gets.chomp.to_i

    puts 'Date: '
    selected_date = gets.chomp.to_s

    rental = Rental.new(selected_date, @books[selected_book - 1], @people[selected_person])
    @rentals << rental
    puts 'Book was successfully rented.'
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    puts "Rentals for person #{person.name}:"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
    end
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'OOP School Library!'
    puts 'Please enter the number for the task you want to perform:'
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person (teacher or student).'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person ID.'
    puts '7 - Exit'
  end
end
