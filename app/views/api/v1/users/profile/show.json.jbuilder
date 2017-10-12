json.data do
  json.personal_data do
    json.full_name @current_user.full_name
    json.email @current_user.email
    if @current_user.entrepreneur
      json.work_plays @current_user.work_plays
      json.facebook @current_user.facebook if @current_user.facebook.present?
      json.phone @current_user.phone if @current_user.facebook.present?
    end
  end
end
