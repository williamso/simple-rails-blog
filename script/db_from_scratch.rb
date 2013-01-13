env = ARGV[0] || 'development'
`rake db:drop RAILS_ENV=#{env} && rake db:create RAILS_ENV=#{env} && rake db:migrate RAILS_ENV=#{env} && rake db:seed RAILS_ENV=#{env}`
`rake db:test:clone RAILS_ENV=#{env}` if env == 'development'
