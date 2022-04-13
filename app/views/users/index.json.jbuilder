json.array!(@records) do |record|
  json.id record, :user_id
  json.start record.created_at.strftime("%Y-%m-%d")
end