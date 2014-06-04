class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :maker_id
      t.integer :account_id
      t.string :right

      t.timestamps
    end
  end
end
