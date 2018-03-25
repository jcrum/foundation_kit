# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::BaseClass do
  context 'basic initialization' do
    let(:base_class) { described_class.new }

    it { is_expected.to respond_to(:to_h) }

    it 'should return an empty hash' do
      expect(base_class.to_h).to be_empty
    end
  end

  context 'extended classes' do
    class Example < FoundationKit::BaseClass
      attr_reader :foobar
      def initialize
        @foo = 1
        @bar = 2
        super(foo: 1, bar: 2)
      end

      private

      def after_initialize(**args)
        @foobar = args[:foo] + args[:bar]
      end
    end

    let(:extended_class) { Example.new }

    it 'should call after_initialize' do
      expect(extended_class.foobar).to eq(3)
    end

    it 'should create a hash with the instance variables' do
      expect(extended_class.to_h).to eq(foo: 1,
                                        bar: 2,
                                        foobar: 3)
    end
  end

  context 'hide password attributes (password, pwd, pass)' do
    class PasswordTest < described_class
      def initialize(**args)
        @password = args[:password]
        @pwd = args[:pwd]
        @pass = args[:pass]
        super(args)
      end
    end

    let(:password_instance) do
      PasswordTest.new(password: 'a password',
                       pwd: 'a password',
                       pass: 'a password')
    end

    it 'should mask sensitve data attributes when exposed as to hash' do
      expect(password_instance.to_h).to eq(password: '**************',
                                           pwd: '**************',
                                           pass: '**************')
    end

    context 'should mask sensitve data attributes when exposed as to_string' do
      it_should_behave_like 'password mask from string output',
                            PasswordTest,
                            :to_s
    end

    context 'should mask sensitve data attributes when exposed as to_string' do
      it_should_behave_like 'password mask from string output',
                            PasswordTest,
                            :inspect
    end
  end
end
