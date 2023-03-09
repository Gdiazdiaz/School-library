require_relative './person'
class Teacher < Person
  def initialize(id:, age:, specialization:, name: 'Unknow', parent_permission: true)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.size
    ObjectSpace.each_object(self).to_a
  end
end
