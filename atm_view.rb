# The view for our ATM app
class AtmView
  # shows the options available within the app
  def show_options
    puts "\nWelcome to your friendly neighbourhood ATM!"
    puts "Please select from the following options:"
    puts "1. Display balance"
    puts "2. Make a withdrawl"
    puts "3. Make a deposit"
    puts "4. Exit"
  end
end
