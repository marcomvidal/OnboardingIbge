require_relative '../views/home_view'

class HomeController
  attr_accessor :error

  def initialize
    @view = HomeView.new
  end

  def menu
    @view.banner
    @view.show_menu @error
    safely_choose
  end

  private

  def safely_choose
    begin
      @view.select_option
    rescue Exception => error
      @error = error
      menu
    end
  end
end