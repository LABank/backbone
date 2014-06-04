class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :source_id
      t.integer :destination_id
      t.integer :maker_id
      t.integer :amount
      t.text :description
      t.date :day

      t.timestamps
    end
  end
end
