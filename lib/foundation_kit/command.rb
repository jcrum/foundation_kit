# frozen_string_literal: true

module FoundationKit
  #
  # Implements an abstract class for the command design pattern.
  #
  # @author jcrum
  #
  class Command < BaseClass
    attr_reader :description
    attr_reader :execution_order
    attr_reader :result

    #
    # Creates an instance of the Command class
    #
    # @param description: nil [String] Description of the command.
    # @param execution_order: nil [Integer] Used to determine order of execution
    # .  if it is part of a composite command exection plan and order matters.
    # @param **args Additional arguments used for subclasses to pass to
    # .  post initialization hooks.
    #
    # @return [FoundationKit::Command]
    def initialize(description: nil, execution_order: nil, **args)
      @description = description
      @execution_order = execution_order
      @success = false

      super(description: description, execution_order: execution_order, **args)
    end

    #
    # Executes the logic for the command
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :execute

    #
    # Successful execution checker
    #
    # @return [Boolean] Was the execution of the command successful?
    def success?
      @success || false
    end

    #
    # Hook to execute if the command was successful
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :on_success

    #
    # Hook to execute if the command was not successful
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :on_failure

    #
    # Hook to execute before the command executes the core logic
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :before_execution

    #
    # Hook to execute after the command executes the core logic
    #
    # @abstract
    # @raise [FoundationKit::Errors::MethodNotImplmentedError]
    abstract_definition :after_execution
  end
end
