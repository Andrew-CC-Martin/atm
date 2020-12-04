module Validators
  def self.validate_input(input)
    # convert input to integer
    num_input = input.to_i
    # if integer == 1..4 return true
    if num_input > 0 && num_input < 5
      return true
    # else return false
    else
      return false
    end
  end
end
