class Decade
  attr_accessor :decade, :frequency

  def initialize(decade:, frequency:)
    @decade = decade.tr('[', '').tr(']', '')
    @frequency = frequency
  end
end