require_relative '../student'

describe Student do
  context 'student test' do
    student = Student.new(id: 123, age: 22, classroom: 'red', name: 'gio', parent_permission: true)

    it 'test student instance creating object' do
      student.should be_instance_of Student
    end

    it 'test age of student' do
      student.age.should eql 22
    end

    it 'test classroom student' do
      student.classroom.should eql 'red'
    end

    it 'test name of student' do
      student.name.should eql 'gio'
    end

    it 'test hooky method' do
      student.play_hooky.should eql '¯\(ツ)/¯'
    end
  end
end
