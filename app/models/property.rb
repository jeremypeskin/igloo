class Property < ActiveRecord::Base
  belongs_to :user
  has_many :units, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :recurring_events, dependent: :destroy
end
