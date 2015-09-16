ActiveAdmin.register Changeful::Content, as: 'Contents' do
  permit_params :content
  actions :all, except: [:new, :destroy]

  index do
    selectable_column
    id_column
    column :key, ->(row) { row.key.titleize  }
    column :content
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :file_path
      row :key
      row :content
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Details' do
      input :key, input_html: { disabled: true  }
      if f.object.view_type == 'html'
        input :content, as: :ckeditor
      else
        input :content
      end
    end
    actions
  end
end
