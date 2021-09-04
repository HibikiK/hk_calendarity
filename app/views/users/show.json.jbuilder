json.array!(@participations) do |p|
  json.extract! p.event, :id
  json.title p.event.name
  json.start p.event.start_at   
  json.end p.event.end_at
  json.url event_url(p.event, format: :html) 
end