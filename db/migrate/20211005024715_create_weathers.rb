class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.date :date
      t.float :lat, precision: 4
      t.float :lon, precision: 4
      t.string :city
      t.string :state
      t.json :temperatures
    end
  end
end
