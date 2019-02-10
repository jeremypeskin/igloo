class AddCategoryToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :category, :integer, default: 0
  end
end
