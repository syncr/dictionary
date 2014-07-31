require 'rspec'
require 'term'


describe Term do
  before do
    Term.clear
  end

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

  describe '.clear' do
    it 'empties out all of the saved words' do
      Term.new("trapeze", "a glorified swing").save
      Term.clear
      expect(Term.dictionary).to eq []
    end
  end

  describe '.dictionary' do
    it 'is empty at first' do
      expect(Term.dictionary).to eq []
    end
  end

  describe '#save' do
    it "adds a word to an array of saved words" do
      test_word = Term.new("trapeze", "a glorified swing")
      expect(Term.dictionary).to eq([test_word])
    end
  end
end
