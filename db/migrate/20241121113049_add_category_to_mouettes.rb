class AddCategoryToMouettes < ActiveRecord::Migration[7.1]
  def change
    add_column :mouettes, :category, :string
  end
end
