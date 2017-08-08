json.data do
  json.courses @courses do |course|
    json.name course.name
    json.price course.price
    json.duration course.duration
    json.description course.description
    json.start_date course.start_date
    json.status course.status
    
    json.contacts course.contacts do |contact|
      json.name contact.name
      json.email contact.email
      json.phone contact.phone
      json.facebook contact.facebook
    end
  end
end