class AddDefaultAvailableToMouette < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:mouettes, :availability, "✅ Disponible")
  end
end
