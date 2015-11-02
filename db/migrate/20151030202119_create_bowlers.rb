class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|

      # t.belongs_to :league, index:true
      t.string :name

      t.timestamps null: false
    end
  end
end
