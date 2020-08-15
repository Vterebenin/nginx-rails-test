#!/usr/bin/env puma

directory '/var/www/my_awesome_rails_app/current'
rackup "/var/www/my_awesome_rails_app/current/config.ru"
environment 'production'

tag ''

pidfile "/var/www/my_awesome_rails_app/shared/tmp/pids/puma.pid"
state_path "/var/www/my_awesome_rails_app/shared/tmp/pids/puma.state"
stdout_redirect '/var/www/my_awesome_rails_app/current/log/puma.error.log', '/var/www/my_awesome_rails_app/current/log/puma.access.log', true


threads 4,16



bind 'unix:///var/www/my_awesome_rails_app/shared/tmp/sockets/my_awesome_rails_app-puma.sock'

workers 0




restart_command 'bundle exec puma'


preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = ""
end


