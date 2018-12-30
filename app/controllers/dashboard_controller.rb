class DashboardController < ApplicationController
  def index
    @expenses = current_user.expenses
    @invoices = current_user.invoices
    @sum_of_expenses = @expenses.sum(:amount)
    @sum_of_invoices = @invoices.sum(:amount)
    @net_income = @sum_of_invoices - @sum_of_expenses
    @properties = current_user.properties

    @grouped_expenses = current_user.expenses.group_by_month(:date).sum(:amount)
    @grouped_invoices = current_user.invoices.group_by_month(:date).sum(:amount)
    @monthly_net_income = @grouped_invoices.merge(@grouped_expenses) { |k, v1, v2| v1 - v2 }
  end
end
