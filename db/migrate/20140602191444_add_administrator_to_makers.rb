class AddAdministratorToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :administrator, :boolean, default: false
  end
end
