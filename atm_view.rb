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

  # note - this really be on a model class
  def get_balance
    File.read('balance.txt')
  end

  def show_balance
      # show balance
      balance = get_balance()
      puts "balance: $#{balance}"
  end

  def print_withdrawl
    puts "How much do you want to withdraw?"
  end

  def get_amount
    gets.chomp
  end
end
