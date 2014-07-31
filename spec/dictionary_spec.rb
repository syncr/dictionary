require 'rspec'
require 'dictionary'

describe Term do
  it "will initialize Term class with the word and definition" do
    test_word = Term.new("trapeze","a glorified swing")
    expect(test_word).to be_an_instance_of Term
  end

  it "will read a new word from input" do
    test_word = Term.new("trapeze", "a glorified swing")
    expect(test_word.word).to eq 'trapeze'
  end

  it "will read a new definition from input" do
    test_word = Term.new("trapeze", "a glorified swing")
    expect(test_word.definition).to eq 'a glorified swing'
  end

  # describe '#save' do
  #   it "will read a new definition from input" do
  #     test_word = Term.new("trapeze", "a glorified swing")
  #     test_word.word
  #     test_word.definition
  #     test_word.save
  #     expect(test_word.dictionary).to eq "{'trapeze' => 'a glorified swing'}"
  #   end
  # end

  describe '.dictionary' do
    it 'is populated with the word as a key and definition as a value' do
      test_word = Term.new("trapeze","a glorified swing")
      expect(Term.dictionary["trapeze"]).to eq 'a glorified swing'
    end
  end
end
