require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameble.correct_name.slice(0, 10)
  end
end
