class CreateJackpots < ActiveRecord::Migration
  def change
    create_table :jackpots do |t|
      t.belongs_to :league, index:true
      t.decimal :balance, precision: 8, scale: 2, :default => 0
      t.timestamps null: false
    end
  end
end
