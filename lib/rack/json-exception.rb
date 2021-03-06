require 'yajl'

module Rack
  class JsonException
    def initialize(app, logger = nil, &custom_log)
      @app = app
      @logger = logger
      @custom_log = custom_log
    end

    def call(env)
      begin
        @app.call(env)
      rescue => crash
        json_log(env, crash)
        raise
      end
    end

    private

    def json_log(env, crash)
      logger = @logger || env['rack.errors']
      exception_log = {
        :message => crash.message,
        :backtrace => crash.backtrace.join("\n"),
        :host => env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR'] || '-',
        :file => crash.backtrace[0].split(':')[0],
        :line => crash.backtrace[0].split(':')[1]
      }

      exception_log = @custom_log.call(exception_log, env, crash) if @custom_log

      logger.write(Yajl::Encoder.encode(exception_log))
      logger.write("\n")
    end
  end
end
