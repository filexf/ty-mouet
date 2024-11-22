class AddDefaultRatingToMouette < ActiveRecord::Migration[7.1]
  def change
        change_column_default(:mouettes, :rating, 2.5)
  end
end
