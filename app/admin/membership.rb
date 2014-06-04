ActiveAdmin.register Membership do
  permit_params :date, :entity_id, :maker_id, :fee, :newsletter

  index do
    selectable_column
    id_column
    column :date
    column :entity_id
    column :maker_id
    actions
  end

  filter :date
  filter :entity_id
  filter :maker_id
  filter :newsletter

  form do |f|
    f.inputs "Membership Details" do
      f.input :date
      f.input :entity, :include_blank => false
      f.input :maker, :include_blank => false
      f.input :fee
      f.input :newsletter
    end
    f.actions
  end

end
