json.data do
  json.course do
    json.call(
      @course,
      :name,
      :price,
      :description,
      :start_date
    )
    json.call(
      @course.category,
      :category
    )
  end
end
