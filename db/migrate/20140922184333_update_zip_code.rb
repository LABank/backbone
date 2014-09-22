class UpdateZipCode < ActiveRecord::Migration
  def change
    change_column :makers, :zip, :string
  end
end
