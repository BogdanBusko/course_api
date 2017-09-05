set :output, "#{path}/log/cron_log.log"
set :chronic_options, :hours24 => true

every 1.days, at: '3:00' do
  runner "Course.update_course_days_to_start", environment: "development"
end

