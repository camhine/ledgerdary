require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.color = true
  config.default_formatter = 'doc'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

$:.unshift(File.join(File.expand_path(File.dirname(__FILE__)), 'lib'))

require 'ledgerdary'
