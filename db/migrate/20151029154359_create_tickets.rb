class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.belongs_to :jackpot, index:true
      t.belongs_to :bowler, index:true
      t.belongs_to :league, index:true
      

      t.decimal :price, precision: 8, scale: 2, :default => 10.00

      t.timestamps null: false

    end
  end
end
