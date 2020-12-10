require './validators'

class AtmController
  def initialize(atm_view)
    @atm_view = atm_view
  end

  def make_withdrawl
    @atm_view.print_withdrawl
    # get amount from the user
    amount = @atm_view.get_amount
    # validate the input
    valid = Validators.validate_positive_int(amount)
    if !valid
      # print out error message
      puts "invalid amount, please enter a positive number"
      make_withdrawl()
    end

    # get the bank balance
    balance = @atm_view.get_balance()
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

  def make_deposit
    puts "How much to deposit?"

    amount = gets.chomp
    valid = Validators.validate_positive_int(amount)

    if !valid
      puts "invalid amount, please enter a positive number"
      make_deposit()
    end

    balance = @atm_view.get_balance()
    new_amount = (balance.to_i + amount.to_i).to_s
    File.write('balance.txt', new_amount)
    puts "Your new balance is $#{new_amount}"
  end

  def run
    # welcome loop
    @atm_view.show_options

    input = gets.chomp
    input_valid = Validators.validate_input(input)
    if !input_valid
      # print error message for invalid input
      # and re-print welcome
      puts "Invalid input, please enter a number from 1-4"
    end

    case input.to_i
    when 1
      @atm_view.show_balance()
    when 2
      # make a withdrawl
      make_withdrawl()
    when 3
      # make a deposit
      make_deposit()
    when 4
      # exit the program
      puts "goodbye"
      exit(0)
    end

    run()
  end
end
