# frozen_string_literal: true

module FoundationKit
  #
  # Base repository class
  #
  # @author [jcrum]
  #
  class Repository < BaseClass
    #
    # [initialize description]
    # @param connector: nil [FoundationKit::Connector] Connector to use
    # @param source: nil [type] [description]
    #
    # @return [type] [description]
    def initialize(connector: nil, source: nil)
      @connector = connector
      @source = source
      super
    end

    #
    # Fetch method
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :fetch

    #
    # Create method
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :create

    #
    # Update method
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :update

    #
    # Delete method
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :delete
  end
end
