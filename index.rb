require_relative 'validators'
require_relative 'atm_view'
require_relative 'atm_controller'

system("clear")

if ARGV.length > 0
  # handle command line arguments
  if ARGV[0] == '-h' || ARGV[0] == '--help'
    # print the help menu
    puts "you asked for help"
  end
else
  # run app
  atm_view = AtmView.new
  atm_controller = AtmController.new(atm_view)
  atm_controller.run()
end
