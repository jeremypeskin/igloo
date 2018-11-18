class CreateRecurringEvents < ActiveRecord::Migration
  def change
    create_table :recurring_events do |t|
      t.belongs_to :user, index:true
      t.belongs_to :property, index:true
      t.belongs_to :unit, index:true
      t.integer :amount
      t.string :description
      t.integer :category

      t.timestamps null: false
    end
  end
end
