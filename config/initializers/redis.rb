#encoding: utf-8

Redis.current = Redis.new url: ENV['REDIS_URL'], driver: :hiredis, network_timeout: 5

