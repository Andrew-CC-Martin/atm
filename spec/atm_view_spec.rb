require '../atm_view.rb'

describe 'Atm View' do
  it 'shows the app\'s options' do
    expected_output = "\nWelcome to your friendly neighbourhood ATM!\n"\
    "Please select from the following options:\n"\
    "1. Display balance\n"\
    "2. Make a withdrawl\n"\
    "3. Make a deposit\n"\
    "4. Exit\n"

    app_view = AtmView.new
    expect { app_view.show_options() }.to output(expected_output).to_stdout
  end
end
