json.data do
  json.course do
    json.(
      @course,
      :title,
      :price,
      :duration,
      :description,
      :start_date,
      :status
    )
    json.(
      @course.category,
      :category
    )
  end
end