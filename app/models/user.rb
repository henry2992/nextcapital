class User < ActiveRecord::Base

  # Associations 
  belongs_to :leagues

  # Device Data for Users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
