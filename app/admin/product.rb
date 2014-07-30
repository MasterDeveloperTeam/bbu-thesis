ActiveAdmin.register Product do
  controller do 
    def permitted_params
      params.permit product:[:title,:description,:image_url, :pdf,:price]
    end
  end
  index do
    column :created_at
    column :title
    column :price do |product|
        number_to_currency(product.price)
    end
    column :image_url
    column :description
    column :pdf_file_name
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
      form do |f|
        f.inputs "Details" do
          f.input :title
          f.input :image_url
          f.input :price
          f.input :description
        end
        f.inputs "PDF" do
          f.file_field :pdf
        end
        f.actions
      end
  
end
