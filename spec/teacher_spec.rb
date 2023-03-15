require_relative '../teacher'

describe Teacher do
  context 'teacher test' do
    teacher = Teacher.new(id: 123, age: 22, specialization: 'math', name: 'gio', parent_permission: true)

    it 'test student instance creating object' do
      teacher.should be_instance_of Teacher
    end

    it 'test age of student' do
      teacher.age.should eql 22
    end

    it 'test classroom student' do
      teacher.specialization.should eql 'math'
    end

    it 'test name of student' do
      teacher.name.should eql 'gio'
    end
  end
end
