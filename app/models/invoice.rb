class Invoice < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user

  enum status: [ :Unpaid, :Paid ]

  include Filterable

  scope :property, -> (property_id) { where property_id: property_id }
end
