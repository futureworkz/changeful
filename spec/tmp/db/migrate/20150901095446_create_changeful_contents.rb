class CreateChangefulContents < ActiveRecord::Migration # :nodoc:
  def change
    create_table :changeful_contents do |t|
      t.string :key
      t.text :content
      t.string :view_type
      t.timestamps null: true
    end
  end
end
