class Expense < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user
end
