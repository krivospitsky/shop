ActiveAdmin.register Article do
  form do |f|
    f.inputs do
      f.input :title
      f.input :text, :as => :ckeditor
    end
    f.actions
  end
end
