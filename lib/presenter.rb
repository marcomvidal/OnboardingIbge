class Presenter
  def state_listing(states)
    puts "\nSelecione o estado desejado pela sigla UF:"
    
    states.
      sort_by(&:sigla).
      each { |state| print "#{state.sigla}\t" }
  end

  def state_selection(states)
    print "\nUF desejado: "
    chosen_state = gets.chomp
    return chosen_state if states.any? { |state| state.sigla == chosen_state }

    raise RangeError.new \
      'O UF digitado não existe. Escolha um dos UFs existentes.'
  end

  def name_listing()
end