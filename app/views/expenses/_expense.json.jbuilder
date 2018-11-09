json.extract! expense, :id, :amount, :description, :date, :created_at, :updated_at
json.url expense_url(expense, format: :json)
