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
    while true
      case @home.menu
      when Application.options.keys[0]
        state = @states.index
        @states.show state
      when Application.options.keys[1]
        state = @states.index
        city = @cities.index state
        @cities.show city
      when Application.options.keys[2]
        names = @years.index
        @years.show names
      when Application.options.keys[3]
        break
      end
    end
  end
end

$LOAD_PATH << __dir__
Application.new.main