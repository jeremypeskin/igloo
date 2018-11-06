class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :user, index:true
      t.belongs_to :property, index:true
      t.string :name
      t.integer :rent

      t.timestamps null: false
    end
  end
end
