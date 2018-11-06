class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :rent

      t.timestamps null: false
    end
  end
end
