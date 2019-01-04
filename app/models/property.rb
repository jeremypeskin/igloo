class Property < ActiveRecord::Base
  include Finance

  belongs_to :user

  has_many :units, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :recurring_events, dependent: :destroy

  def interest_payments
    interest_array = amortization.interest
    interest_array = date_months.zip(interest_array)
    interest_payments = Hash[*interest_array.flatten]
    interest_payments
  end

  def total_payments
    payments_array = amortization.payments.map { |payment| payment.abs }
    payments_array = date_months.zip(payments_array)
    total_payments = Hash[*payments_array.flatten]
    total_payments
  end

  def principal_payments
    principal_payments = total_payments.merge(interest_payments) { |k, v1, v2| v1 - v2 }
    principal_payments
  end

  def amortization
    rate = Rate.new(mortgage_interest, :apr, :duration => (mortgage_term * 12))
    amortization = Amortization.new(mortgage_principal, rate)
    amortization
  end

  def date_months
    first_payment = 1.month.since(mortgage_start_date)
    last_payment = mortgage_start_date + mortgage_term.years
    date_range = first_payment..last_payment
    date_months = date_range.map {|d| Date.new(d.year, d.month, 1) }.uniq
    date_months.map {|d| d.strftime "%m/%Y" }
    date_months
  end

end
