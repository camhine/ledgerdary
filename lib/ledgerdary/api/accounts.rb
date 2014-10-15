require 'json'

require 'ledgerdary/api'
require 'ledgerdary/statements/store'

class Ledgerdary::API::Accounts < Grape::API
  format :json

  # Where PLACEHOLDER identifies an account.
  post 'PLACEHOLDER/statements' do
    self_href = "#{settings.stack.first[:mount_path]}/PLACEHOLDER/statements"
    statement_id = Ledgerdary::Statements::Store.new('PLACEHOLDER').store(params['file']['tempfile'])
    { 
      _links:
      {
        self:      { href: self_href },
        statement: { href: "#{self_href}/#{statement_id}" }
      }
    }
  end

end
