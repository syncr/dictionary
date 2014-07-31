require 'rspec'
require 'dictionary'

describe Term do
  it "will initialize Term class with the word and definition" do
    test_word = Term.new("trapeze","a glorified swing")
    expect(test_word).to be_an_instance_of Term
  end

  # it "will return an empty hash if no words are present"
end
