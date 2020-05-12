require 'sqlite3'
require_relative 'database'
require_relative 'controllers/home_controller'
require_relative 'controllers/states_controller'
require_relative 'controllers/cities_controller'
require_relative 'controllers/years_controller'

class Application
  def initialize
    @home = HomeController.new
    @states = StatesController.new
    @cities = CitiesController.new
    @years = YearsController.new
  end

  def self.options
    {
      1 => { description: 'Ranking de nomes por Unidade Federativa (UF)' },
      2 => { description: 'Ranking de nomes por cidade' },
      3 => { description: 'Frequência do nome ao longo dos anos' },
      4 => { description: 'Sair' }
    }
  end

  def main
    prepare_database

    while true
      case @home.menu
      when Application.options.keys[0]; @states.show(@states.select)
      when Application.options.keys[1]
        @cities.show(@cities.select(@states.select))
      when Application.options.keys[2]; @years.show(@years.select)
      when Application.options.keys[3]; break
      end
    end

  end

  private

  def prepare_database
    Database.start
    
    [@states, @cities].
      each { |entity| entity.populate } unless Database.created?
  end
end

$LOAD_PATH << __dir__
Application.new.main