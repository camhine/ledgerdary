$:.unshift(File.join(File.expand_path(File.dirname(__FILE__)), 'lib'))

require 'ledgerdary/api/service'

require 'rack'

run Ledgerdary::API::Service
