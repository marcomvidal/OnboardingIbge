require_relative 'model'

class City < Model
  attr_accessor :id, :name, :state_id

  def initialize(id:, name:, state_id:)
    @id = id
    @name = name.upcase
    @state_id = state_id
  end
end