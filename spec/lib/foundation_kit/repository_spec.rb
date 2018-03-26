# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::Repository do
  let(:repo) { described_class.new }

  context 'basic repository functionality' do
    %i[fetch
       create
       update
       delete].each do |x|

      it { is_expected.to respond_to x }
      it_should_behave_like 'MethodNotImplmented', described_class, x
    end
  end
end
