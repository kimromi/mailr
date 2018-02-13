require "mailr/version"
require 'mailr/configurable'
require "mailr/imap_client"

module Mailr
  class << self
    def imap_client
      @imap_client ||= Mailr::ImapClient.new
    end

    def method_missing(method_name, *args, &block)
      if imap_client.respond_to?(method_name)
        return imap_client.send(method_name, *args, &block)
      end

      super
    end
  end
end
