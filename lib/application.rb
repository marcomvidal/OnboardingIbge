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
      { id: 1, description: 'Pela Unidade Federativa (UF)' },
      { id: 2, description: 'Pelo nome da cidade' },
      { id: 3, description: 'Pelo ano' }
    ]
  end

  def main
    case @home.menu
    when Application.options[0][:id]; @states.index
    when Application.options[1][:id]; @cities.index
    when Application.options[2][:id]; @years.index
    end
  end
end

$LOAD_PATH << __dir__
Application.new.main