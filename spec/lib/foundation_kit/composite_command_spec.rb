# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::CompositeCommand do
  context 'basic initialization' do
    subject { described_class.new }

    it { is_expected.to respond_to(:add_command) }
    it { is_expected.to respond_to(:execute) }
  end
end
