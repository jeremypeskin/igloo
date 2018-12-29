class DashboardController < ApplicationController
  def index
    @expenses = current_user.expenses
    @invoices = current_user.invoices
  end
end
