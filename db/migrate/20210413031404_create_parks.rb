class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
