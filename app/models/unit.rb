class Unit < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :expenses
  has_many :invoices
  has_many :recurring_events
end
