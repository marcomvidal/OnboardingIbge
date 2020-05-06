require_relative 'service'
require_relative 'view'

class Application

  def initialize
    @service = Service.new
    @view = View.new
  end

  def main
    @view.menu
    @view.by_state @service.get_all_states
  end
end

Application.new.main()