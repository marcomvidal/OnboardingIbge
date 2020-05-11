require_relative 'model'

class State < Model
  attr_accessor :id, :acronym

  def initialize(id:, acronym:)
    @id = id
    @acronym = acronym
  end
end