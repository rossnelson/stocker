class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :filename
      t.string :source
      t.text :comments
      t.boolean :unique_usage_right
      t.string :unique_usage_right_filename
      t.references :shared_usage_right

      t.timestamps
    end
    add_index :photos, :shared_usage_right_id
  end
end
