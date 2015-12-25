#encoding: utf-8

Redis.current = Redis.new url: ENV['TPL_REDIS_URL'], driver: :hiredis, network_timeout: 5

