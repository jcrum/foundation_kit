# frozen_string_literal: true

#
# Adds additional behavior to Class
#
# @author [jcrum]
#
class Class
  #
  # Provides the ability to define an abstract method on a class
  # @param *args
  #
  # @raise [FoundationKit::Errors::ClassNotImplmentedError]
  # @raise [FoundationKit::Errors::MethodNotImplmentedError]
  def abstract_definition(*method_names)
    # rubocop:disable Style/GuardClause, Lint/UnusedBlockArgument, Lint/ShadowingOuterLocalVariable
    method_names.each do |method_name|
      define_method(method_name) do |*args|
        if method_name == :initialize
          raise FoundationKit::Errors::ClassNotImplementedError.new(class_name: self.class.name)
        else
          raise FoundationKit::Errors::MethodNotImplementedError.new(class_name: self.class.name, method_name: method_name)
        end
      end
      # rubocop:enable Style/GuardClause, Lint/UnusedBlockArgument, Lint/ShadowingOuterLocalVariable
    end
  end
end
