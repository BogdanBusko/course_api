RailsAdmin.config do |config|
  config.model 'Course' do
    list do
      fields :name, :user, :category, :information_is_confirmed, :created_at

      configure(:name) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].name}.to_s", href: "/admin/course/#{bindings[:object].id}") } }
      configure(:user) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].user.name}.to_s", href: "/admin/user/#{bindings[:object].user_id}") } }
      configure(:category) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].category.name}.to_s", href: "/admin/category/#{bindings[:object].category_id}") } }
    end

    show do
      configure(:start_date) { strftime_format '%Y-%m-%d' }
      configure(:user) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].user.name}.to_s", href: "/admin/user/#{bindings[:object].user_id}") } }
      configure(:category) { pretty_value { bindings[:view].content_tag(:a, "#{bindings[:object].category.name}.to_s", href: "/admin/category/#{bindings[:object].category_id}") } }
    end

    edit do
      fields :name, :information_is_confirmed, :price, :description, :start_date, :category, :contacts
      configure(:start_date) { strftime_format '%Y-%m-%d' }
    end
  end

  config.model 'Category' do
    list do
      fields :name, :information_is_confirmed, :created_at, :courses, :user
    end

    edit do
      exclude_fields :user
    end
  end

  config.model 'User' do
    list do
      fields :name, :email, :work_plays, :account_confirmed
    end

    edit do
      exclude_fields :auth_token, :courses, :categories
    end
  end

  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == 'admin'
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
