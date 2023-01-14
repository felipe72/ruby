module Auth
  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_database(data_base)
    data_base.map { |user| { username: user[:username], password: create_hash_digest(user[:password]) } }
  end

  def self.verify_credentials(username, password, data_base)
    found = data_base.select do |entry|
      entry[:username] == username && verify_hash_digest(entry[:password]) == password
    end

    return found unless found.empty?

    'Credentials were not correct'
  end
end
