require_relative '../views/home_view'

class HomeController
  def initialize
    @view = HomeView.new
  end

  def menu
    @view.banner

    begin
      @view.select_option
    rescue RangeError => error
      puts error
      @view.select_option
    end
  end
end