require 'terminal-table'
require_relative 'base_view'

class YearsView < BaseView
  def choose
    print "\nNomes desejados, separados por vírgula: "
    split_names remove_accentuation(read_sanitized)
  end

  private

  def split_names(names)
    names.split(',').map { |name| name.strip }
  end
end