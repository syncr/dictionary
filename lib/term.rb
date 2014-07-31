class Term

  @@dictionary = []
  def Term.clear
    @@dictionary = []
  end

  def initialize(word, definition)
    @word = word
    @definition = definition
    save
  end

  def Term.dictionary
    @@dictionary
  end

  def save
    @@dictionary << self
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def set_definition(new_definition)
    @definition = new_definition
  end
end


