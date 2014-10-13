require 'json'

require 'ledgerdary/api'
require 'ledgerdary/statements/store'

class Ledgerdary::API::Accounts < Grape::API
  format :json

  # Where PLACEHOLDER identifies an account.
  post 'PLACEHOLDER/statements' do
    url = Ledgerdary::Statements::Store.new('PLACEHOLDER').store(params['file']['tempfile'])
    { _links: { self: route.route_path.split('(').first,
                statement: url } }
  end
end
