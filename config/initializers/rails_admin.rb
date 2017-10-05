RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.model 'Course' do
    list do
      fields :name, :user, :category, :information_is_confirmed, :created_at

      configure(:name) { pretty_value { bindings[:view].content_tag(:a, "#{ bindings[:object].name }", href: "/admin/course/#{ bindings[:object].id }") } }
      configure(:user) { pretty_value { bindings[:view].content_tag(:a, "#{ bindings[:object].user.name }", href: "/admin/user/#{ bindings[:object].user_id }") } }
      configure(:category) { pretty_value { bindings[:view].content_tag(:a, "#{ bindings[:object].category.name }", href: "/admin/category/#{ bindings[:object].category_id }") } }
    end

    show do
      configure(:start_date) { strftime_format "%Y-%m-%d" }
      configure(:user) { pretty_value { bindings[:view].content_tag(:a, "#{ bindings[:object].user.name }", href: "/admin/user/#{ bindings[:object].user_id }") } }
      configure(:category) { pretty_value { bindings[:view].content_tag(:a, "#{ bindings[:object].category.name }", href: "/admin/category/#{ bindings[:object].category_id }") } }
    end

    edit do
      fields :name, :information_is_confirmed, :price, :description, :start_date, :category, :contacts

      configure(:start_date) { strftime_format "%Y-%m-%d" }
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
