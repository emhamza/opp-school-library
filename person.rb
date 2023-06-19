class Person 
    attr-reader :id, :name, :age

    def initialize(id, name, age = "unknown", parent_permision = true)
        @id = id
        @name = name
        @age = age
        @parent_permision = parent_permision
    end
    
    def name = (new_name)
        @name = new_name
    end

    def age = (new_age)
        @age = new_age
    end

    def can_use_services?
        of_age? || @parent_permision
    end

    private
    
    def of_age?
        @age >= 18
    end
end