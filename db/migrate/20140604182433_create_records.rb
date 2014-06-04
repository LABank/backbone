class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :account_id
      t.text :description
      t.integer :amount
      t.integer :wire_transfer_id
      t.date :day

      t.timestamps
    end
    add_index :records, :account_id
    add_index :records, :wire_transfer_id
  end
end
