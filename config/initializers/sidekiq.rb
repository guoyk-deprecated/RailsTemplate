#encoding: utf-8

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['TPL_REDIS_URL'], driver: :hiredis, network_timeout: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['TPL_REDIS_URL'], driver: :hiredis, network_timeout: 5 }
end

