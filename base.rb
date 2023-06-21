require_relative 'person'
require_relative 'decorator'
require_relative 'capitalizedecorator'
require_relative 'trimmerdecorator'

person = Person.new(22, 'maximilianus')
puts "Original Name: #{person.correct_name}"
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Trimmed Name: #{capitalized_trimmed_person.correct_name}"
