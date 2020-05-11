require_relative 'model'

class Name < Model
  attr_accessor :id, :name, :rate, :ranking

  def initialize(id:, name:, rate:, ranking:)
    @id = id
    @name = name
    @rate = rate
    @ranking = ranking
  end
end