class AddStrikeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :strike, :integer
  end
end
