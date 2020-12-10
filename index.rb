require_relative 'validators'
require_relative 'atm_view'

system("clear")

def welcome_and_input(atm_view)
  atm_view.show_options

  input = gets.chomp
  input_valid = Validators.validate_input(input)
  if !input_valid
    # print error message for invalid input
    # and re-print welcome
    puts "Invalid input, please enter a number from 1-4"
  end

  case input.to_i
  when 1
    show_balance()
  when 2
    # make a withdrawl
    make_withdrawl()
  when 3
    # make a deposit
  when 4
    # exit the program
    puts "goodbye"
    exit(0)
  end

  welcome_and_input(atm_view)
end

def show_balance
    # show balance
    balance = get_balance()
    puts "balance: $#{balance}"
end

def get_balance
  File.read('balance.txt')
end

def make_withdrawl
  puts "How much do you want to withdraw?"
  # get amount from the user
  amount = gets.chomp
  # validate the input
  valid = Validators.validate_withdrawl(amount)
  if !valid
    # print out error message
    puts "invalid amount, please enter a positive number"
    make_withdrawl()
  end

  # get the bank balance
  balance = get_balance()
  # check the balance > amount
  valid = Validators.validate_amount_against_balance(amount, balance)
  if !valid
    puts "Your withdrawl is greater than your balance"
    make_withdrawl()
  end
  # update the bank balance
  updated_amount = (balance.to_i - amount.to_i).to_s
  File.write('balance.txt', updated_amount)
  # print the withdrawl amount
  puts "Your new balance is $#{updated_amount}"
end

atm_view = AtmView.new
welcome_and_input(atm_view)
