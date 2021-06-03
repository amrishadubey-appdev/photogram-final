class AddPicuploadToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :picupload, :string
  end
end
