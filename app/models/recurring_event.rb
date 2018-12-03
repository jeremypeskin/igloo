class RecurringEvent < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user

  enum category: [ :Invoice, :Expense ]
  enum event_type: [ :Unit, :Property ]
end
