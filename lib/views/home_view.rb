require_relative 'base_view'

class HomeView < BaseView
  def banner
    puts "\e[H\e[2J" \
         "-------------------------------------\n" \
         "Consulta de nomes mais comuns no IBGE\n" \
         "-------------------------------------\n\n"
  end

  def show_menu(options, error)
    options.each { |option| puts "#{option[:id]}. #{option[:description]}\n" }
    puts "ERRO: #{error}" if error
  end

  def select_option(options)
    print "\nSua opção [1-#{options.length}]: "
    option = gets.chomp.to_i
    return option if options.map { |o| o[:id] }.include? option

    raise RangeError.new \
      "Opção inválida. Selecione uma opção entre 1 e #{options.length}."
  end
end