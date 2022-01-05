require 'pg'
class Login
    def initialize(user, pass)
        @username = user
        
        #***TODO: PULL @username FROM DATABASE
        #VERIFY PASSWORD***
    end
end

#conn = PG.connect( :dbname => 'rmc_development_db', :user => 'admin', :password => 'team4', :host => 'localhost' )
#conn.exec("\dt")