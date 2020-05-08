require 'terminal-table'

class StatesView
  def list_all(states)
    puts "\nSelecione o estado desejado pela sigla UF:"

    states.
      sort_by(&:sigla).
      each { |state| print "#{state.sigla}\t" }
  end

  def choose(states)
    print "\nUF desejado: "
    acronym = gets.chomp.upcase
    state = states.filter { |state| state.sigla == acronym }
    return state.first if state.any?

    raise RangeError.new 'O UF digitado não existe. Escolha um existente.'
  end

  def list_names(criteria, names)
    table = Terminal::Table.new do |t|
      t.add_row ['Ranking', 'Nome', 'Frequência']
      t.add_separator
      names.each do |name|
        t.add_row [name.ranking, name.nome, name.frequencia]
      end
    end

    puts "\n#{criteria}\n#{table}"
  end
end