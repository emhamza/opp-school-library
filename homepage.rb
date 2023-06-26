class HomePage
    def initialize(app)
        @app = app
    end

    def display_options
        @app.options
        print '>>> :'
        gets.chomp.to_i
    end

    def manage_selection(options)
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

        selection = tasks[options] || tasks[:default]

        if selection == :list_rentals_for_person
            puts 'Enter the person ID:'
            person_id = gets.chomp.to_i
            @app.send(selection, person_id)
          else
            @app.send(selection)
          end
      
          exit if options == 7
        end
      
        def start
          loop do
            manage_selection(display_options)
            puts '\n.'
        end
    end
end