class State
  attr_accessor :id, :acronym

  def initialize(id:, acronym:)
    @id = id
    @acronym = acronym
  end
end