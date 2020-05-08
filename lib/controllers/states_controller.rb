require_relative '../service'
require_relative '../views/states_view'

class StatesController
  def initialize
    @service = Service.new
    @view = StatesView.new
  end

  def all_names
    states = @service.all_states
    @view.list_all states
    state = safely_choose states

    table_types(state).each do |c|
      @view.list_names c[:title], @service.names_by(c[:filters])
    end
  end

  private

  def safely_choose(states)
    begin
      @view.choose states
    rescue RangeError => error
      puts error
      safely_choose states
    end
  end

  def table_types(state)
    [
      { title: 'Todos', filters: { localidade: state.id } },
      { title: 'Homens', filters: { sexo: 'M', localidade: state.id } },
      { title: 'Mulheres', filters: { sexo: 'F', localidade: state.id } }
    ]
  end
end
