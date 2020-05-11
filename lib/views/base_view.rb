class BaseView
  def loading_message(subject)
    puts "Carregando #{subject}. Por favor, aguarde."
  end

  def read_sanitized
    gets.chomp.strip.upcase
  end

  def press_a_key_to_continue
    print "\nPressione uma tecla para continuar. . . "
    gets.chomp
  end

  def remove_accentuation(word)
    {
      ['á','à','â','ä','ã'] => 'a',
      ['Ã','Ä','Â','À'] => 'A',
      ['é','è','ê','ë'] => 'e',
      ['Ë','É','È','Ê'] => 'E',
      ['í','ì','î','ï'] => 'i',
      ['Î','Ì'] => 'I',
      ['ó','ò','ô','ö','õ'] => 'o',
      ['Õ','Ö','Ô','Ò','Ó'] => 'O',
      ['ú','ù','û','ü'] => 'u',
      ['Ú','Û','Ù','Ü'] => 'U',
      ['ç'] => 'c', ['Ç'] => 'C',
      ['ñ'] => 'n', ['Ñ'] => 'N'
    }.each do |accents, replacement|
      accents.each do |character|
        word = word.gsub(character, replacement)
      end
    end

    word
  end
end