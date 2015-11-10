class Bowler < ActiveRecord::Base

	# Validations
	validates :name, presence: true

	# Associations with Memberships
	has_many :memberships
	has_many :leagues, :through  =>  :memberships
	has_many :tickets
	
	# Add Ticket to Bowler
	def add_ticket(id)
		ticket = Ticket.find_by_id(id) # Find the Ticket with ID
		current_bowler = Bowler.find_by_id(id) # Find the Bowlers with ID
	    ticket.bowler_id = current_bowler # Ticket ID belong to Bowler 
	    ticket.save
	end

	

end
