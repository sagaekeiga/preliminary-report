require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/crontab.log'
set :environment, :development
env :PATH, '/home/ubuntu/.nvm/versions/node/v4.6.1/bin'


#2時間ごとに動かす
every 2.minutes do
  rake 'twitter:tweet'
end