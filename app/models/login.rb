require 'pg'
class Login
    def initialize(user, pass)
        @username = user
        
        #***TODO: PULL @username FROM DATABASE
        #VERIFY PASSWORD***
    end
end

# conn = PG.connect( :dbname => 'rmc_development_db', :user => 'admin', :password => 'team4', :host => 'localhost' )
# sql_string = "CREATE TABLE IF NOT EXISTS \"user\" (\"username\" varchar(50) PRIMARY KEY NOT NULL, \"password\" varchar(50) NOT NULL, \"role\" varchar(15) NOT NULL);"
# conn.exec(sql_string)
# sql_string = "INSERT INTO \"user\" (\"username\", \"password\", \"role\") VALUES ('tony', 'password', 'student') ON CONFLICT DO NOTHING;"
# conn.exec(sql_string)
# conn.exec("SELECT * FROM \"user\";") do |result|
#     result.each do |row|
#         puts row.values_at("username", "password", "role")
#     end
# end