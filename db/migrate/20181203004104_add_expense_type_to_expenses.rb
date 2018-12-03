class AddExpenseTypeToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_type, :integer, default:0
  end
end
