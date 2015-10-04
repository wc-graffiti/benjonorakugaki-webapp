class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :spot_id, null: false
      t.string :name
      t.decimal :lat, precision: 11, scale: 8
      t.decimal :lon, precision: 11, scale: 8

      t.timestamps null: false
    end
  end
end
