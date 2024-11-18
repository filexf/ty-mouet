class CreateMouettes < ActiveRecord::Migration[7.1]
  def change
    create_table :mouettes do |t|
      t.string :name
      t.string :availability
      t.float :rating
      t.float :latitude
      t.float :longitude
      t.string :accessories
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
