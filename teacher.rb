require_relative './person'
class Teacher < Person
    def initialize(specialization)
        @specialization
    end
    def can_use_services?
        result = "true"
        result
    end
end