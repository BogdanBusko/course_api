json.data do
  json.courses @courses_by_category do |course|
    json.id course.id.to_s
    json.name course.name
    json.price course.price
    json.duration course.duration
    json.start_date course.start_date
  end
end
