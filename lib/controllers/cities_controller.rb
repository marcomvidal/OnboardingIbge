require_relative '../service'
require_relative '../views/cities_view'

class CitiesController < BaseController
  def initialize
    @service = Service.new
    @view = CitiesView.new
  end

  def index(state)
    @view.loading_message 'cidades'
    cities = @service.cities_by_state state
    safely_choose cities, lambda { @view.choose cities }
  end

  def show(city)
    Report.types(place: city).each do |name|
      @view.list_names(name[:title], @service.names_ranking(name[:filters]))
    end
  end
end