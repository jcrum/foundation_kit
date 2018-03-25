# frozen_string_literal: true

module FoundationKit
  #
  # BaseCass provides a core set of functionality for all
  #  classes that extend from it.
  #
  # @author [jmc]
  #
  class BaseClass
    # The initialize method - DUH
    # @param **args it accepts all of the children arguments
    def initialize(**args)
      after_initialize(args)
    end

    # Returns a Hash representation of the current object
    # @return [Hash]
    # @example Convert an instance to a hash
    #   myobj.to_h
    def to_h
      temp = {}
      instance_variables.each do |var|
        temp[var.to_s.delete('@').to_sym] = hide_instance_variables(var)
      end
      temp
    end

    def to_s
      to_s_string = "#{self.class}: "
      instance_variables.each do |var|
        to_s_string += "#{var}: #{hide_instance_variables(var)}, "
      end
      to_s_string += "object_id: 0x00#{(object_id << 1).to_s(16)}"
      to_s_string
    end
    alias inspect to_s

    private

    # After initialize hook - should be defined in children class
    # @param **args should simple take in all the parameters from the initialize method by default
    def hide_instance_variables(var)
      if !%i[@password @pwd @pass].include? var
        instance_variable_get(var)
      else
        '**************'
      end
    end

    def after_initialize(**_args)
      nil
    end
  end
end
