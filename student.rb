require_relative './person'
class Student < Person
  def initialize(id:, age:, classroom:, name: 'Unknow', parent_permission: true)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_accessor :classroom
  classroom = Classroom.new

  def play_hooky
    '¯\(ツ)/¯'
  end
end
