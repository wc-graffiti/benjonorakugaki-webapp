class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid
      t.boolean :achieve

      t.timestamps null: false
    end
  end
end
