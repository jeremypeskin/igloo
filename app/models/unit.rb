class Unit < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :expenses, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :recurring_events, dependent: :destroy
end
