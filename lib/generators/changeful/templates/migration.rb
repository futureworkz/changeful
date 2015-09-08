class CreateChangefulContents < ActiveRecord::Migration
  def change
    create_table :changeful_contents do |t|
      t.string :key
      t.text :content
      t.string :view_type
      t.string :file_path
      t.timestamps null: true
    end
  end
end
