ActiveAdmin.register Customer do
  # permited params
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # filter
  filter :full_name
  filter :phone_number
  filter :email_address
  filter :notes
  filter :created_at

  # list
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column :created_at
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), width: 50
      end
    end
    actions
  end

  # show page
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :created_at
      row :updated_at
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: 150
        end
      end
    end
  end

  # Form
  form html: { multipart: true } do |f|
    f.semantic_errors # display error

    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file

      # edit page image
      if f.object.image.attached?
        div do
          image_tag url_for(f.object.image), width: 100
        end
      end
    end

    f.actions
  end
end
