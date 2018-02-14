require "mailr/version"
require 'mailr/configurable'
require "mailr/imap"

module Mailr
  class << self
    def imap
      @imap ||= Mailr::Imap.new
    end

    def method_missing(method_name, *args, &block)
      if imap.respond_to?(method_name)
        return imap.send(method_name, *args, &block)
      end

      super
    end
  end
end
