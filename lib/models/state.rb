require_relative '../database'

class State
  attr_accessor :id, :acronym

  def initialize(id:, acronym:)
    @id = id
    @acronym = acronym
  end

  def self.table
    self.name.downcase
  end

  def self.all
    Database.instance.execute("SELECT * FROM #{self.table}")
      .map { |state| State.new(id: state['id'], acronym: state['acronym'])}
  end

  def save
    query = "INSERT INTO #{self.class.table} (id, acronym) VALUES (?, ?)"
    Database.instance.execute query, @id, @acronym
  end
end