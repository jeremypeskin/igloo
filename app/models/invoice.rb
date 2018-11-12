class Invoice < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  belongs_to :user

  enum status: [ :Unpaid, :Paid ]
end
