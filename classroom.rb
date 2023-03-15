class Classroom
  attr_reader :students

  def initialize(label:)
    @label = label
    @students = []
  end

  attr_accessor :label

  def add_student(student)
    student = Student.new(id: student.id, name: student.name, age: student.age, classroom: self)
  end
end
