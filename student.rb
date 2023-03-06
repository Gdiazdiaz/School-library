require_relative './person'
class Student < Person
    def initialize(classroom)
        @classroom
    end

    def play_hooky
        result = '¯\(ツ)/¯'
        result
    end
end