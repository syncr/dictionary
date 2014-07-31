class Term
  @@dictionary = {}
  def initialize(word, definition)
    @word = word
    @definition = definition
    save
  end

  def Term.dictionary
    @@dictionary
  end

  def save
    @@dictionary[@word] = @definition
  end

  def word
    @word
  end

  def definition
    @definition
  end
end


