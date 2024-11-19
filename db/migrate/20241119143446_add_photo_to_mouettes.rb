class AddPhotoToMouettes < ActiveRecord::Migration[7.1]
  def change
    add_column :mouettes, :photo, :string
  end
end
