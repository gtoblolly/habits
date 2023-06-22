json.array!(@all_records) do |record|
  json.id record.id
  json.start record.created_at.strftime("%Y-%m-%d")
end