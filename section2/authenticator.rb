require_relative 'auth'
require 'bcrypt'
require 'io/console'

data_base = [
  { username: 'mashrur', password: 'pass1' },
  { username: 'jack', password: 'pass2' },
  { username: 'arya', password: 'pass3' },
  { username: 'jonshow', password: 'pass4' },
  { username: 'heisenberg', password: 'pass5' }
]

secure_data_base = Auth.create_secure_database(data_base)

def print_divider
  25.times { print '-' }
  puts
end

puts 'Welcome to the authenticator'
print_divider
puts 'This program will take input from the user and compare password'

loop do
  print 'Username: '
  username = gets.chomp
  print 'Password: '
  password = gets.chomp

  puts Auth.verify_credentials(username, password, secure_data_base)
  puts 'Press n to quit or any other key to continue:'
  key = $stdin.getch

  break if key == 'n'
end
