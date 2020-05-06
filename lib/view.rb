require_relative 'presenter'

class View
  def initialize
    @presenter = Presenter.new
  end

  def menu
    puts "-------------------------\n" \
         "Consulta de nomes no IBGE\n" \
         "-------------------------\n"
  end

  def by_state(states)
    @presenter.state_listing(states)

    begin
      state = @presenter.state_selection(states)
    rescue RangeError => error
      puts(error)
      by_state(states)
    end
  end

end