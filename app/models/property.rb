class Property < ActiveRecord::Base
  belongs_to :user
  has_many :units
  has_many :expenses
  has_many :invoices
  has_many :recurring_events
end
