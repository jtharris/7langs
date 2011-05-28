
number = rand(100)
guess = nil

while (number != guess)
  puts "Your guess is too #{ guess < number ? 'low' : 'high' }!" unless guess.nil?

  print 'Please guess a number from 0-99:  '
  input = gets

  exit if input.start_with? 'q'
  guess = input.to_i
end

puts 'You guessed correctly!'
