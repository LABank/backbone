ActiveAdmin.register Transfer do
  actions :index

  index do
    id_column
    column :day
    column :amount
    column :description
  end

  filter :source
  filter :destination
end
