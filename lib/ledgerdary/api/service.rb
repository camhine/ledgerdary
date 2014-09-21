
require 'ledgerdary/api'
require 'ledgerdary/api/account'

class Ledgerdary::API::Service < Grape::API
  mount Ledgerdary::API::Account => 'service/account'
end
