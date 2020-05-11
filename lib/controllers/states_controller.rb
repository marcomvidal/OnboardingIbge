require_relative 'base_controller'
require_relative '../service'
require_relative '../views/states_view'
require_relative '../presenters/report'

class StatesController < BaseController
  def initialize
    @service = Service.new
    @view = StatesView.new
  end

  def index
    @view.loading_message 'UFs'
    states = @service.all_states
    @view.list_all states
    safely_choose states, lambda { @view.choose states }
  end

  def show(state)
    Report.types(place: state).each do |state|
      @view.list_names(state[:title], @service.names_ranking(state[:filters]))
    end

    @view.press_a_key_to_continue
  end
end
