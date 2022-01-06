require 'digest'
class User
    attr_accessor :username
    def initialize(user, pass)
       @username = user #assign the user's username
       @salt = rand(100000000..999999999999999).to_s #generate a unique salt to append to pass
       @password_hash = Digest::SHA256.hexdigest(pass + @salt) #generate password hash by hashing pass and the salt
    end
end
