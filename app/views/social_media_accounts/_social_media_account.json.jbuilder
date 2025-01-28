json.extract! social_media_account, :id, :user_id, :old_platform, :old_account, :new_platform, :new_account, :created_at, :updated_at
json.url social_media_account_url(social_media_account, format: :json)
