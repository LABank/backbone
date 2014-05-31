class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.date :date
      t.integer :entity_id
      t.integer :maker_id
      t.integer :fee
      t.boolean :newsletter

      t.timestamps
    end
    add_index :memberships, :entity_id
    add_index :memberships, :maker_id
  end
end
