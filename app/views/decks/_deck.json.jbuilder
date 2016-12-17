json.extract! deck, :id, :user_id, :cards, :size, :created_at, :updated_at
json.url deck_url(deck, format: :json)