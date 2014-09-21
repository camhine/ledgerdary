
require 'ledgerdary/api'

class Ledgerdary::API::Account < Grape::API
  format :json

  resource :records do
    post do
      "'placeholder' : 'This is where financial records will be posted.'"
    end
  end
end
