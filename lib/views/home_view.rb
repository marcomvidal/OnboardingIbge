class HomeView
  def banner
    puts "\e[H\e[2J" \
         "-------------------------------------\n" \
         "Consulta de nomes mais comuns no IBGE\n" \
         "-------------------------------------\n"
  end

  def show_menu(error)
    Application.options.each do |option|
      puts "#{option[:id]}. #{option[:description]}\n"
    end

    puts "ERRO: #{error}" if error
  end

  def select_option
    print "\nSua opção [1-#{Application.options.length}]: "
    option = gets.chomp.to_i
    return option if Application.options.map { |o| o[:id] }.include? option

    raise RangeError.new \
      "Opção inválida. Selecione uma opção entre 1 e #{OPTIONS.length}."
  end
end