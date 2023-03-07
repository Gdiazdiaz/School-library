require_relative './nameable'
class BaseDecorator < Nameable
  def initialize(*)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
