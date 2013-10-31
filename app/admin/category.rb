ActiveAdmin.register Category do
  form do |f|
    f.inputs do
      f.input :image, :hint => f.template.image_tag(f.object.image.url(:medium))
      if (:image.present?)
        f.input :delete_image, :as=> :boolean, :required => false, :label => 'Remove image'
      end
      f.input :name
      f.input :description, as: :ckeditor
      f.input :hidden
      f.input :sort
      f.input :seo_name
      f.input :parent, as: :select
    end
    f.buttons
  end
  controller do
    def permitted_params
      params.permit(:category => [:name, :description, :hidden, :sort, :seo_name, :image, :parent_id])
    end
    def find_resource
         scoped_collection.friendly.find(params[:id])
    end
  end

end
