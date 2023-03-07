require_relative './nameble'
class BaseDecorator < Nameble
  def initialize(*)
    super()
    @nameble = nameble
  end

  def correct_name
    @nameble.correct_name
  end
end
