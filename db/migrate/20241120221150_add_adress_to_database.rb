class AddAdressToDatabase < ActiveRecord::Migration[7.1]
  def change
    add_column :mouettes, :address, :string
  end
end
