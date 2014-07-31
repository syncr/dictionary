require './lib/term'
require 'pry'

@current_word
@found_word

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
      word_search
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

def word_search
  puts "Great! Here are the words in our Emporium."

  Term.dictionary.each do |instance|
    puts "#{instance.word}"
  end

  puts "\n\n"
  puts "What word interests you?"

  user_input = gets.chomp
  @current_word = user_input
  search
end

def search
  Term.dictionary.each do |instance|
    if @current_word != instance.word
      next
    elsif @current_word == instance.word
      @found_word = instance
      puts "Alright we found your word."
      menu_options
    else
      puts "Sorry, the Emporium doesn't recognize that selection. =("
      puts "Please try again."
      puts "\n\n"
      word_search
    end
  end
end

def menu_options
  puts "If you would like to delete this word, type 'd'."
  puts "If you would like to view this word's definition, type 'v'."
  puts "If you would like to edit this word's definition, type 'e'."
  puts "-or- if you'd like to exit, type 'x' to return to the start."

  user_input = gets.chomp

  if user_input == 'd'
    delete_word
  elsif user_input == 'v'
    view_definition
  elsif user_input == 'e'
    edit_definition
  elsif user_input == 'x'
    webster
  end
end

def view_definition
  Term.dictionary.each do |instance|
    if @current_word == instance.word
      puts "The definition of #{instance.word} is #{instance.definition}"
      puts "\n\n"
    end
  end
end

def delete_word
  puts "Are you sure you'd like to delete #{@found_word.word}? y/n"
  user_input = gets.chomp
  if user_input == 'y'
    Term.dictionary.delete_if { |instance| instance == @found_word }
  elsif user_input == 'n'
    puts "Whew, so glad you didn't say 'yes'. Let's revisit your options."
    menu_options
  else
    puts "Sorry, the Emporium doesn't recognize that selection. =("
    puts "Please try again."
    puts "\n\n"
    delete_word
  end
end

def edit_definition
  puts "What would you like the new definition of #{@found_word.word} to be?"
  new_definition = gets.chomp
  @found_word.set_definition(new_definition)

end

webster
