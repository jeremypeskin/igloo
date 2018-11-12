class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :user, index:true
      t.belongs_to :property, index:true
      t.belongs_to :unit, index:true
      t.string :description
      t.integer :amount
      t.date :date
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
