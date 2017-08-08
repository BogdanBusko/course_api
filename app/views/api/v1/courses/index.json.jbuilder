json.data do
  json.courses @courses do |course|
    json.name course.name
    json.price course.price
    json.duration course.duration
    json.description course.description
    json.start_date course.start_date
    json.status course.status
  end
end