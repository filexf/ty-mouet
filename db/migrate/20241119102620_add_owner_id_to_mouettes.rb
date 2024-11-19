class AddOwnerIdToMouettes < ActiveRecord::Migration[7.1]
  def change
    add_reference :mouettes, :owner, foreign_key: { to_table: :users }
  end
end
