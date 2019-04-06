class Expense < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user

  enum expense_type: [ :Unit, :Property ]
  enum category: [ :Operating, :Interest, :Principal, :Other]

  include Filterable

  scope :category, -> (category) { where category: category }
  scope :property, -> (property_id) { where property_id: property_id }
end
