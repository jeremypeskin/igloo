class DashboardController < ApplicationController
  include Finance

  def index
    @expenses = current_user.expenses
    @invoices = current_user.invoices.where(status: 1)
    @sum_of_expenses = @expenses.sum(:amount)
    @sum_of_invoices = @invoices.sum(:amount)
    @net_income = @sum_of_invoices - @sum_of_expenses
    @properties = current_user.properties

    @grouped_expenses = @expenses.group_by_month(:date).sum(:amount)
    @grouped_invoices = @invoices.group_by_month(:date).sum(:amount)
    @monthly_net_income = @grouped_invoices.merge(@grouped_expenses) { |k, v1, v2| v1 - v2 }
    calculate_payments()
  end

  private

  def calculate_payments
    property = Property.find(22)
    rate = Rate.new(property.mortgage_interest, :apr, :duration => (property.mortgage_term * 12))
    amortization = Amortization.new(property.mortgage_principal, rate)
    interest_array = amortization.interest
    payments_array = amortization.payments.map { |payment| payment.abs }

    first_payment = 1.month.since(property.mortgage_start_date)
    last_payment = property.mortgage_start_date + 15.years
    date_range = first_payment..last_payment
    date_months = date_range.map {|d| Date.new(d.year, d.month, 1) }.uniq
    date_months.map {|d| d.strftime "%m/%Y" }
    interest_array = date_months.zip(interest_array)
    @interest_payments = Hash[*interest_array.flatten]

    payments_array = date_months.zip(payments_array)
    @total_payments = Hash[*payments_array.flatten]

    @principal_payments = @total_payments.merge(@interest_payments) { |k, v1, v2| v1 - v2 }

  end
end
