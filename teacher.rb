require_relative './person'
class Teacher < Person
  def initialize(id:, age:, specialization:, name: 'Unknow', parent_permission: true)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
