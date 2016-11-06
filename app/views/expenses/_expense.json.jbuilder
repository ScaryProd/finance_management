json.extract! expense, :id, :location, :description, :total, :date, :created_at, :updated_at
json.url expense_url(expense, format: :json)