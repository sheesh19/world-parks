class AddRegionToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :region, :string
  end
end
