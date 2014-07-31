require './lib/term'
require 'pry'

def webster
  loop do
    puts "Welcome to Webster's Word Emporium"
    puts "If you'd like to contribute a new word to the Emporium, type 'c'."
    puts "If you'd like to list the Emporium's words, press 'l'"
    puts "To leave the Emporium, type 'x'"

    user_input = gets.chomp

    if user_input == 'c'
      create_word
    elsif user_input == 'l'
      list_words
    elsif user_input == 'x'
      puts 'Come back any time!'
      exit
    end
  end
end

def create_word
  puts "What new word would you like to contribute?"
  user_word = gets.chomp
  puts "Wonderful! What is the definition of this word?"
  user_definition = gets.chomp
  new_word = Term.new(user_word, user_definition)
end

def list_words
  puts "Great! Here are the words in our Emporium."
  Term.dictionary.each do |word|
    puts "#{word.word}: #{word.definition}"
  end
  puts "\n\n"
  webster
end

  # list words
  # delete word

  # show word definition
  # edit word definition

webster
