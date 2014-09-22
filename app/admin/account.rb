ActiveAdmin.register Account do
  actions :index
  
  index do
    id_column
    column :name
    column :uid
  end

  filter :name
  filter :uid
end
