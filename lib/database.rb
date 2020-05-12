require 'sqlite3'

class Database
  def self.schema
    [
      {
        table: City.table,
        fields: 'id INTEGER PRIMARY KEY, name TEXT, state_id INTEGER'
      },
      {
        table: State.table,
        fields: 'id INTEGER PRIMARY KEY, acronym TEXT'
      }
    ]
  end

  def self.instance
    database = SQLite3::Database.open 'database.db'
    database.results_as_hash = true
    database
  end

  def self.start
    self.schema.each do |t|
      self.instance.execute \
        "CREATE TABLE IF NOT EXISTS #{t[:table]} (#{t[:fields]})"
    end
  end

  def self.created?
    self.schema.reduce do |t, result|
      count = self.instance.execute "SELECT COUNT(*) AS c FROM #{t[:table]}"
      count.first['c'] > 0
    end
  end

end