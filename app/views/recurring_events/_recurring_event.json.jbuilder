json.extract! recurring_event, :id, :amount, :description, :category, :created_at, :updated_at
json.url recurring_event_url(recurring_event, format: :json)
