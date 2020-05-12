class Population
  attr_accessor :type, :id, :name, :population

  def initialize(type:, id:, name:, population:)
    @type = type
    @id = id.to_i
    @name = name
    @population = population.to_f
  end

  def percentual(rate)
    "#{(rate.to_f * 100 / @population).round(2)} %"
  end
end