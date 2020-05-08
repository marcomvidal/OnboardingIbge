require_relative 'base_controller'
require_relative '../views/home_view'

class HomeController < BaseController
  attr_accessor :error

  def initialize
    @view = HomeView.new
  end

  def menu
    @view.banner
    options = Application.options

    @view.show_menu options, @error
    safely_choose options, lambda { @view.select_option options }
  end
end