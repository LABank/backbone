ActiveAdmin.register Entity do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Entity Details" do
      f.input :name
    end
    f.actions
  end

end
