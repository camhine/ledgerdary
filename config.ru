$LOAD_PATH.unshift(File.join(File.expand_path(File.dirname(__FILE__)), 'lib'))

require 'rack'
require 'rack/cors'
require 'ledgerdary/api/service'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :options, :post]
  end
end

run Ledgerdary::API::Service
