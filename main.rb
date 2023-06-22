require_relative 'app'

def menu(app)
  app.options
  print '>>> :'
  gets.chomp.to_i
end

def manage_selection(app, option)
  tasks = {
    1 => :list_all_books,
    2 => :list_of_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit,
    default: :invalid_option
  }

  selection = tasks[option] || tasks[:default]

  if selection == :list_rentals_for_person
    puts 'Enter the person ID:'
    person_id = gets.chomp.to_i
    app.send(selection, person_id)
  else
    app.send(selection)
  end

  exit if option == 7
end

def main
  app = App.new

  loop do
    manage_selection(app, menu(app))
    puts '\n.'
  end
end

main
