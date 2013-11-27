ActiveAdmin.register Product do
  index do
    column :id
    column :image do |product|
      if product.images[0]
        image_tag(product.images[0].image.url(:thumb))
      end
    end

    column :name do |product|
      link_to product.name, edit_admin_product_path(product)
    end
    column :price
    column :sku
    column :count
    default_actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :price
      f.input :discount
      # f.input :attrs
      # f.input :options
      f.input :category, as: :select
      f.input :sku
      f.input :count
      f.input :hidden
      f.input :sort
      f.input :manufacturer, as: :select
      f.input :seo_name
      f.has_many :images, allow_destroy: true, new_record: true do |cf|
        cf.input :id, as: :hidden
        cf.input :image
      end

    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit product: [:name, images_attributes: [:image, :id, :_delete]]
    end
  end
end
