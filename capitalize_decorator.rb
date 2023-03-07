require_relative './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameble.correct_name.capitalize
  end
end
