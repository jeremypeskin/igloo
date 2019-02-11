class AddRecurringMortgageToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :recurring_mortgage, :boolean, default:false
  end
end
