require 'rspec'
require 'dictionary'

describe Term do
  it "will initialize Term class with the word and definition" do
    test_word = Term.new("trapeze","a glorified swing")
    expect(test_word).to be_an_instance_of Term
  end

  describe '.dictionary' do
    it 'is populated with the word as a key and definition as a value' do
      test_word = Term.new("trapeze","a glorified swing")
      expect(Term.dictionary["trapeze"]).to eq 'a glorified swing'
    end
  end
end
