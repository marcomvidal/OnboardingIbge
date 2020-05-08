require_relative '../service'
require_relative '../views/years_view'

class YearsController
  def initialize
    @service = Service.new
    @view = YearsView.new
  end

  def index
    @view.choose
  end

  def show(names)
    names.each do |name|
      list_decades name, @service.name_on_decades(name)
    end
  end

  def list_decades(name, history)
    table = Terminal::Table.new do |t|
      t.add_row ['Período', 'Frequência']
      t.add_separator
      history.each { |decade| t.add_row [decade.decade, decade.frequency] }
    end

    puts "\n#{name}\n#{table}"
  end
end