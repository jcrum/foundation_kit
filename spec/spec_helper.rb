# frozen_string_literal: true

require 'bundler/setup'
require 'foundation_kit'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  RSpec.shared_examples 'password mask from string output' do |klass, method_name|
    let(:instance) do
      klass.new(password: 'a password',
                pwd: 'a password',
                pass: 'a password')
    end
    let(:to_s_output) { instance.send(method_name) }
    it 'should contain the class name' do
      expect(to_s_output).to include("#{klass.name}: ")
    end
    it 'should contain the object id' do
      expect(to_s_output).to include('object_id: 0x00')
    end
    it 'should contain @password: ************** ' do
      expect(to_s_output).to include('@password: **************')
    end
    it 'should contain @pwd: ************** ' do
      expect(to_s_output).to include('@pwd: **************')
    end
    it 'should contain @pass: ************** ' do
      expect(to_s_output).to include('@pass: **************')
    end
    it 'should not contain @password: a password' do
      expect(to_s_output).to_not include('@password: a password')
    end
    it 'should not contain @pwd: a password' do
      expect(to_s_output).to_not include('@pwd: a password')
    end
    it 'should not contain @pass: a password' do
      expect(to_s_output).to_not include('@pass: a password')
    end
  end
end
