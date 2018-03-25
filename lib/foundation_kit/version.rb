# frozen_string_literal: true

module FoundationKit
  # Blatently stolen from Rails/version.rb
  #  https://github.com/rails/rails/blob/master/version.rb
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0
    PRE   = 'alpha'

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
