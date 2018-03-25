# frozen_string_literal: true

module FoundationKit
  #
  # FoundationKit::Errors
  #
  # @author [jcrum]
  #
  module Errors
    #
    # Abstract Method Error
    #
    # @author [jcrum]
    #
    class MethodNotImplementedError < StandardError
      #
      # @param class_name: [String] name of the class where the abstract method is called
      # @param method_name: [String] name of the abstract method called
      # @param message: 'is an abstract method and has not been implemented yet.' [String] message to override
      #
      # @return MethodNotImplementedError
      def initialize(class_name:, method_name:, message: 'is an abstract method and has not been implemented yet.')
        super("#{class_name}##{method_name} #{message}")
      end
    end

    #
    # Abstract Class Error
    #
    # @author [jcrum]
    #
    class ClassNotImplementedError < StandardError
      #
      # @param class_name: [String] name of the class where the abstract method is called
      # @param message: 'is an abstract class and has not been implmented yet.' [String] message to override
      #
      # @return ClassNotImplementedError
      def initialize(class_name:, message: 'is an abstract class and has not been implmented yet.')
        super("#{class_name} #{message}")
      end
    end
  end
end
