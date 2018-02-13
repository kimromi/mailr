require 'net/imap'

module Mailr
  class ImapClient
    include Mailr::Configurable

    def search
      # imap search
    end

    private

    def imap
      return @imap if @imap

      @imap = Net::IMAP.new(config.imap_endpoint)
      @imap.authenticate('LOGIN', config.mail_address, config.password)
      @imap
    end
  end
end
