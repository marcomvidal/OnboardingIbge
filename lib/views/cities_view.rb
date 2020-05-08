require 'terminal-table'
require_relative 'base_view'

class CitiesView < BaseView
  def choose(cities)
    print "\nCidade desejada: "
    selected_city = read_sanitized
    city = cities.filter { |city| city.name == selected_city }
    return city.first if city.any?

    raise RangeError.new 'A cidade digitada não existe. Escolha uma existente.'
  end

  def list_names(criteria, names)
    table = Terminal::Table.new do |t|
      t.add_row ['Ranking', 'Nome', 'Frequência']
      t.add_separator
      names.each { |name| t.add_row [name.ranking, name.name, name.rate] }
    end

    puts "\n#{criteria}\n#{table}"
  end
end