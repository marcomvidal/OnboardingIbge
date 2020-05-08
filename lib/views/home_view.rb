class HomeView
  OPTIONS = [
    { id: 1, description: 'Pela Unidade Federativa (UF)' },
    { id: 2, description: 'Pelo nome da cidade' },
    { id: 3, description: 'Pelo ano' }
  ]

  def banner
    puts "-------------------------------------\n" \
         "Consulta de nomes mais comuns no IBGE\n" \
         "-------------------------------------\n"
  end

  def select_option
    OPTIONS.each { |option| puts "#{option[:id]}. #{option[:description]}\n"}
    print "\nSua opção [1-#{OPTIONS.length}]: "

    option = gets.chomp
    return option if option.between? 1, OPTIONS.length

    raise RangeError.new \
      "Opção inválida. Selecione uma opção entre 1 e #{OPTIONS.length}"
  end
end