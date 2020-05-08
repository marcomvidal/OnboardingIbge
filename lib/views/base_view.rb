class BaseView
  def loading_message(subject)
    puts "Carregando #{subject}. Por favor, aguarde."
  end

  def read_sanitized
    gets.chomp.strip.upcase
  end
end