class BaseController
  def safely_choose(items, action)
    begin
      action.call
    rescue RangeError => error
      puts error
      safely_choose items, action
    end
  end
end