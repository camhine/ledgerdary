
require 'ledgerdary/api'
require 'ledgerdary/api/accounts'

class Ledgerdary::API::Service < Grape::API
  mount Ledgerdary::API::Accounts => 'service/accounts'
end
