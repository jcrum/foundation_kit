# frozen_string_literal: true

module FoundationKit
  #
  # Implements the Composite Command design pattern.
  #
  # @author jcrum
  #
  class CompositeCommand < BaseClass
    attr_reader :commands

    #
    # Creates an instance of the Composite Command
    # @param **args Additional arguments used for subclasses to pass to
    # .  post initialization hooks.
    #
    # @return [FoundationKit::CompositeCommand]
    #
    def initialize(**args)
      @commands = []

      super(args)
    end

    #
    # Adds a command for execution
    # @param command [FoundationKit::Command] and instance of a class that
    # .  extends FoundationKit::Command
    #
    def add_command(command)
      commands << command
    end

    #
    # Executes the commands
    #
    # @todo Implement execution order
    #
    def execute
      commands.each(&:execute)
    end
  end
end
