json.extract! invoice, :id, :description, :amount, :date, :status, :unit_id, :property_id, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
