class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :uid
      t.integer :balance
      t.string :name

      t.timestamps
    end
    add_index :accounts, :uid
  end
end
