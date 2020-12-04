require_relative 'validators'

def welcome_and_input
  system("clear")
  puts "Welcome to your friendly neighbourhood ATM!"
  puts "Please select from the following options:"
  puts "1. Display balance"
  puts "2. Make a withdrawl"
  puts "3. Make a deposit"
  puts "4. Exit"

  input = gets.chomp
  input_valid = Validators.validate_input(input)
  if !input_valid
    # print error message for invalid input
    # and re-print welcome
    puts "Invalid input, please enter a number from 1-4"
    puts "Press any key to continue"
    gets
    welcome_and_input()
  end

  case input.to_i
  when 1
    # show balance
  when 2
    # make a withdrawl
    show_balance()
  when 3
    # make a deposit
  when 4
    # exit the program
    puts "goodbye"
    system("exit")
  end
end

welcome_and_input()
