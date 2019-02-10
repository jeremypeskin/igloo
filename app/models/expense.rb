class Expense < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user

  enum expense_type: [ :Unit, :Property ]
  enum category: [ :Operating, :Interest, :Principal, :Other]
end
