class Classroom
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label

  def add_student(student)
    @students << film
    student.classroom = self
  end
end
