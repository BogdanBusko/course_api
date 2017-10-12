json.data do
  json.categories @categories do |category|
    json.id category.id.to_s
    json.category category.name
  end

  json.courses @courses do |course|
    json.id course.id.to_s
    json.name course.name
    json.price course.price
    json.start_date course.start_date
  end
end
