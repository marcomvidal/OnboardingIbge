require_relative '../service'
require_relative '../views/cities_view'
require_relative '../database'
require_relative '../report'

class CitiesController < BaseController
  def initialize
    @service = Service.new
    @view = CitiesView.new
  end

  def populate
    @view.loading_message 'cidades'
    @service.all_cities.each { |city| city.save }
  end

  def select(state)
    @view.loading_message 'cidades'
    cities = City.by_state state
    safely_choose cities, lambda { @view.choose cities }
  end

  def show(city)
    population = PopulationReader.all.find { |pop| pop.id == city.id }
    Report.types(place: city).each do |name|
      @view.list_names(
        name[:title],
        @service.names_ranking(name[:filters]),
        population
      )
    end

    @view.press_a_key_to_continue
  end
end