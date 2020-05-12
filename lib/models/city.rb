class City
  attr_accessor :id, :name, :state_id

  def initialize(id:, name:, state_id:)
    @id = id
    @name = name.upcase
    @state_id = state_id
    @db = Database.instance
  end

  def self.table
    self.name.downcase
  end

  def self.by_state(state)
    query = "SELECT * FROM #{self.table} WHERE state_id = ?"

    Database.instance.execute(query, state.id)
      .map { |city| City.new(
        id: city['id'],
        name: city['name'],
        state_id: city['state_id']
      )}
  end

  def save
    query = "INSERT INTO #{self.class.table} (id, name, state_id) VALUES (?, ?, ?)"
    Database.instance.execute(query, @id, @name, @state_id)
  end
end