class Person

    # Constructor
    def initialize(id, age, name='Unknown', parent_permission= true)
        # instance variables
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    # Get method
    def id
        @id
    end

    # Get method
    def name
        @name
    end

    # Get method
    def age
        @age
    end

    # Set method
    def name=(name)
        @name
    end

    # Set method
    def age=(age)
        @age
    end

    private
    def is_of_age?
        unless @age>18
            result = false
        else
            result = true
        end
        result
    end

    public
    def can_use_services?
        unless @parent_permission===true || @age>18
            result = false
        else
            result = true
        end
        result
    end
end