json.extract! account, :id, :publicly_visible, :owner_id, :accountable_id, :accountable_type, :created_at, :updated_at
json.url account_url(account, format: :json)
