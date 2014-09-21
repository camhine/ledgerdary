
require 'ledgerdary/api'

class Ledgerdary::API::Account < Grape::API
  resource :records do
    post do
      'Placeholder: This is where financial records will be posted.'
    end
  end
end
