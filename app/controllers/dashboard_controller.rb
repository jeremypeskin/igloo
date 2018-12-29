class DashboardController < ApplicationController
  def index
    @expenses = current_user.expenses
    @invoices = current_user.invoices
    @sum_of_expenses = @expenses.sum(:amount)
    @sum_of_invoices = @invoices.sum(:amount)
    @net_income = @sum_of_invoices - @sum_of_expenses
  end
end
