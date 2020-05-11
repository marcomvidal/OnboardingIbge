require_relative 'model'

class Decade < Model
  attr_accessor :decade, :frequency

  def initialize(decade:, frequency:)
    @decade = decade.tr('[', '').tr(']', '')
    @frequency = frequency
  end
end