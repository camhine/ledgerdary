require 'grape'

require 'ledgerdary/api/accounts'

module Ledgerdary
  module API
    class Service < Grape::API
      mount Ledgerdary::API::Accounts => 'service/accounts'
    end
  end
end
