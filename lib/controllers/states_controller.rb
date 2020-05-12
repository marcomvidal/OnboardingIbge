require_relative 'base_controller'
require_relative '../service'
require_relative '../models/state'
require_relative '../views/states_view'
require_relative '../report'
require_relative '../population_reader'

class StatesController < BaseController
  def initialize
    @service = Service.new
    @view = StatesView.new
  end

  def populate
    @view.loading_message 'estados'
    @service.all_states.each { |state| state.save }
  end

  def select
    @view.loading_message 'UFs'
    states = State.all
    @view.list_all states
    safely_choose states, lambda { @view.choose states }
  end

  def show(state)
    population = PopulationReader.all.find { |pop| pop.id == state.id }
    
    Report.types(place: state).each do |state|
      @view.list_names(
        state[:title],
        @service.names_ranking(state[:filters]),
        population
      )
    end

    @view.press_a_key_to_continue
  end
end
