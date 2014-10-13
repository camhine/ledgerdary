
require 'ledgerdary/api'

class Ledgerdary::API::Accounts < Grape::API
  format :json  

  post 'PLACEHOLDER/statements' do
    # require 'pry'; binding.pry
    "'placeholder' : 'This is where account statements, in CSV format, are posted.'"
  end

  # resource :statements do
  #   post do
  #     "'placeholder' : 'This is where account statements, in CSV format, are posted.'"
  #   end
  # end
end
