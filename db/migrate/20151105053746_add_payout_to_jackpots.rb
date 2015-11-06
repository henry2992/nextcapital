class AddPayoutToJackpots < ActiveRecord::Migration
  def change
    add_column :jackpots, :payout, :decimal, precision: 8, scale: 2
  end
end
