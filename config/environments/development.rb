Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=172800' }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'busko.bogdan@gmail.com',
    password:             'Bogdanvolkrok12',
    authentication:       :plain,
    enable_starttls_auto: true
  }

  config.active_support.deprecation = :log
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
