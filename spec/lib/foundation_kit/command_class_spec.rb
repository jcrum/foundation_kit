# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::Command do
  context 'basic initialization' do
    subject { described_class.new(description: 'Command') }

    it { is_expected.to respond_to(:execute) }
    it { is_expected.to respond_to(:success?) }
    it { is_expected.to respond_to(:on_success) }
    it { is_expected.to respond_to(:on_failure) }
    it { is_expected.to respond_to(:before_execution) }
    it { is_expected.to respond_to(:after_execution) }
  end
end
