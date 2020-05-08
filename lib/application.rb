require_relative 'controllers/home_controller'
require_relative 'controllers/states_controller'
require_relative 'controllers/cities_controller'

class Application
  def initialize
    @home = HomeController.new
    @states = StatesController.new
    @cities = CitiesController.new
  end

  def main
    @home.menu
    @states.all_names
  end
end

$LOAD_PATH << __dir__
Application.new.main