# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::Errors::MethodNotImplementedError do
  class DummyClassAbstractMethod
    abstract_definition :abstract_method
  end
  let(:abstract_method_class) { DummyClassAbstractMethod.new }

  it 'matches the default error message' do
    expect { raise FoundationKit::Errors::MethodNotImplementedError.new(class_name: 'DummyClassAbstractMethod', method_name: 'abstract_method') }.to \
      raise_error(FoundationKit::Errors::MethodNotImplementedError, /DummyClassAbstractMethod#abstract_method is an abstract method and has not been implemented yet./)
  end

  it 'matches a custom error message' do
    expect { raise FoundationKit::Errors::MethodNotImplementedError.new(class_name: 'DummyClassAbstractMethod', method_name: 'abstract_method', message: 'This is a test') }.to \
      raise_error(FoundationKit::Errors::MethodNotImplementedError, /DummyClassAbstractMethod#abstract_method This is a test/)
  end

  it 'should raise MethodNotImplementedError' do
    expect { abstract_method_class.abstract_method }.to \
      raise_error(FoundationKit::Errors::MethodNotImplementedError)
  end
end

RSpec.describe FoundationKit::Errors::ClassNotImplementedError do
  class DummyAbstractClass
    abstract_definition :initialize
  end
  let(:abstract_class) { DummyAbstractClass }

  it 'matches the default error message' do
    expect { raise FoundationKit::Errors::ClassNotImplementedError.new(class_name: 'DummyAbstractClass') }.to \
      raise_error(FoundationKit::Errors::ClassNotImplementedError, /DummyAbstractClass is an abstract class and has not been implmented yet./)
  end

  it 'matches a custom error message' do
    expect { raise FoundationKit::Errors::ClassNotImplementedError.new(class_name: 'DummyAbstractClass', message: 'This is another test.') }.to \
      raise_error(FoundationKit::Errors::ClassNotImplementedError, /DummyAbstractClass This is another test./)
  end

  it 'should raise ClassNotImplementedError' do
    expect { abstract_class.new }.to \
      raise_error(FoundationKit::Errors::ClassNotImplementedError)
  end
end
