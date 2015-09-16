class ChangefulContent < ActiveRecord::Base
  rails_admin do
    label 'Content'
    label_plural 'Contents'
    list do
      field :id
      field :key
      field :content
      field :file_path
      field :updated_at do
        strftime_format "%d-%m-%y"
      end
    end

    show do
      field :id
      field :key
      field :content
      field :file_path
      field :updated_at do
        strftime_format "%d-%m-%y"
      end
    end

    edit do
      field :id do
        read_only true
        help false
      end
      field :key do
        read_only true
        help false
      end
      field :content, :ck_editor
      field :file_path do
        read_only true
        help false
      end
    end
  end
end
