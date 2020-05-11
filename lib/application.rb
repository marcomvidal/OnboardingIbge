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
    [
      { id: 1, description: 'Ranking de nomes por Unidade Federativa (UF)' },
      { id: 2, description: 'Ranking de nomes por cidade' },
      { id: 3, description: 'Frequência do nome ao longo dos anos' },
      { id: 4, description: 'Sair' }
    ]
  end

  def main
    while true
      case @home.menu
      when Application.options[0][:id]
        state = @states.index
        @states.show state
      when Application.options[1][:id]
        state = @states.index
        city = @cities.index state
        @cities.show city
      when Application.options[2][:id]
        names = @years.index
        @years.show names
      when Application.options[3][:id]
        break
      end
    end
  end
end

$LOAD_PATH << __dir__
Application.new.main