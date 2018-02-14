module Mailr
  module Configurable
    def configure
      yield config
    end

    def config
      @config ||= Config.new
    end

    class Config
      attr_accessor :mail_address, :password, :imap_endpoint, :imap_port

      def initialize
        @mail_address  = ENV['MAILR_MAIL_ADDRESS']
        @password      = ENV['MAILR_PASSWORD']
        @imap_endpoint = ENV['MAILR_IMAP_ENDPOINT']
        @imap_port     = ENV['MAILR_IMAP_PORT']
      end
    end
  end
end
