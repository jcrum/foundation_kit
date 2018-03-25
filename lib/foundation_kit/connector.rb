# frozen_string_literal: true

module FoundationKit
  #
  # Base connector class
  #
  # @author [jcrum]
  #
  class Connector < BaseClass
    #
    # Connect method
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :connect
    abstract_definition :disconnect

    def initialize(**args)
      @user = args[:user]
      @password = args[:password]
      @host = args[:host]
      @port = args[:port]
      @database = args[:database]
      @options = args[:options]
      @adapter = args[:adapter]
      super(args)
    end
  end
end
