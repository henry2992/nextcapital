class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|

      t.belongs_to :bowler, index: true
      t.belongs_to :league, index: true

      t.timestamps null: false
    end
  end
end
