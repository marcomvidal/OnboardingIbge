require 'terminal-table'
require_relative 'base_view'

class StatesView < BaseView
  def list_all(states)
    puts "\nSelecione o estado desejado pela sigla UF:"

    states.
      sort_by(&:acronym).
      each { |state| print "#{state.acronym}\t" }
  end

  def choose(states)
    print "\nUF desejado: "
    selected_acronym = read_sanitized
    state = states.filter { |state| state.acronym == selected_acronym }
    return state.first if state.any?

    raise RangeError.new 'O UF digitado não existe. Escolha um existente.'
  end

  def list_names(criteria, names, population)
    table = Terminal::Table.new do |t|
      t.add_row ['Ranking', 'Nome', 'Frequência', 'Percentual']
      t.add_separator
      names.each { |name|
        t.add_row [
          name.ranking, name.name, name.rate, population.percentual(name.rate)
        ]
      }
    end

    puts "\n#{criteria}\n#{table}"
  end
end