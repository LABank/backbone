ActiveAdmin.register Maker do
  permit_params :email, :first_name, :last_name, :administrator,:company , :phone, :address1, :address2, :city, :zip

  index do
    selectable_column
    id_column
    column :email
    column :city
    column :sign_in_count
    column :administrator
    actions
  end

  filter :first_name
  filter :last_name
  filter :email

  form do |f|
    f.inputs "Maker Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :company
      f.input :address1
      f.input :address2
      f.input :city
      f.input :zip
      f.input :administrator
    end
    f.actions
  end

end
