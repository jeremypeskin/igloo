class Expense < ActiveRecord::Base
  has_one :unit
  has_one :property
  has_one :user
end
