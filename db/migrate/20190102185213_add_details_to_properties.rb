class AddDetailsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :mortgage_interest, :decimal
    add_column :properties, :mortgage_term, :integer
    add_column :properties, :mortgage_principal, :integer
    add_column :properties, :mortgage_start_date, :date
  end
end
