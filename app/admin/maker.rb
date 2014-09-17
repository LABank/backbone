ActiveAdmin.register Maker do
  permit_params :email, :first_name, :last_name, :administrator

  index do
    selectable_column
    id_column
    column :email
    column :sign_in_count
    column :administrator
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Maker Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :administrator
    end
    f.actions
  end

end
