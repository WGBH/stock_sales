ActiveAdmin.register SidekickImage do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :title, :alt, :image, :url, :order

  index do 
    column :title
    column :alt
    column :image
    column :url
    column :order
    actions
  end

  form( html: { multipart: true } ) do |f|
    f.inputs "Details" do
      f.input :title
      f.input :alt
      f.input :image, as: :file
      f.input :url
      f.input :order
    end
    f.actions
  end
end
