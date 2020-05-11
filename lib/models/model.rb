require 'sqlite3'

class Model
  DATABASE_FILE = '../database.db'

  def table
    raise NotImplementedError
  end
end