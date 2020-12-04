require '../example_test'

describe 'index.rb - hello' do
  it 'says hello' do
    expect(hello()).to eq("hello world")
  end
end
