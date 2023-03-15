require_relative './app'
require_relative './entry_point'
require_relative './options'

class MainController
  def initialize
    @entry_point = EntryPoint.new
    @options = Options.new
    @app = App.new
  end

  def execute
    puts @entry_point.menu
    @app.send(@options.display)
    execute
  end

  def on_load
    @app.send('load_all')
  end
end

main = MainController.new
main.on_load
main.execute
