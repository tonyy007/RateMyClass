class User < ActiveRecord::Base
     #self.primary_key = 'username'
     # Added to help in integrating role functionality
     #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
