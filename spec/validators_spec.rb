require '../validators'

describe 'Validators.validate_input' do
  it 'checks if input is valid' do
    expect(Validators.validate_input("1")).to eq(true)
    expect(Validators.validate_input("2")).to eq(true)
    expect(Validators.validate_input("3")).to eq(true)
    expect(Validators.validate_input("4")).to eq(true)
    expect(Validators.validate_input("4.23498")).to eq(true)
    expect(Validators.validate_input("4asldksdfl")).to eq(true)

    expect(Validators.validate_input("0")).to eq(false)
    expect(Validators.validate_input("5")).to eq(false)
    expect(Validators.validate_input("500")).to eq(false)
    expect(Validators.validate_input("hello")).to eq(false)
  end
end

describe 'validate withdrawl' do
  it 'is a positive integer' do
    expect(Validators.validate_positive_int("100")).to eq(true)
    expect(Validators.validate_positive_int("000812")).to eq(true)

    expect(Validators.validate_positive_int("-100")).to eq(false)
    expect(Validators.validate_positive_int("hello")).to eq(false)
    expect(Validators.validate_positive_int("adshrj23423;alskd")).to eq(false)
  end

  it 'is <= the current bank balance' do
    expect(Validators.validate_amount_against_balance("300", "500")).to eq(true)

    expect(Validators.validate_amount_against_balance("3000", "500")).to eq(false)
    expect(Validators.validate_amount_against_balance("10", "0")).to eq(false)
  end
end
