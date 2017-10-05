json.data do
  json.course do
    json.(
      @course,
      :name,
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