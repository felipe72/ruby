require 'io/console'
data_base = [
  { username: 'mashrur', password: 'pass1' },
  { username: 'jack', password: 'pass2' },
  { username: 'arya', password: 'pass3' },
  { username: 'jonshow', password: 'pass4' },
  { username: 'heisenberg', password: 'pass5' }
]

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

  found = data_base.select { |entry| entry[:username] == username && entry[:password] == password }

  if !found.empty?
    puts found
  else
    puts 'Credentials were not correct'
  end

  puts 'Press n to quit or any other key to continue:'
  key = $stdin.getch

  break if key == 'n'
end
