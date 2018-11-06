class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.belongs_to :user, index:true
      t.string :address
      t.string :price

      t.timestamps null: false
    end
  end
end
