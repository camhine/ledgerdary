require 'json'

require 'grape'

require 'ledgerdary/statements/store'

module Ledgerdary
  module API
    class Accounts < Grape::API
      format :json

      content_type :csv, 'text/csv'
      formatter :csv, -> (object, _) { object }

      helpers do
        def self_href
          "#{settings.stack.first[:mount_path]}/PLACEHOLDER/statements"
        end
      end

      # Where PLACEHOLDER identifies an account.
      post 'PLACEHOLDER/statements' do
        statement_id = Ledgerdary::Statements::Store.new('PLACEHOLDER')\
                       .store(params['file']['tempfile'])
        {
          _links:
          {
            self:      { href: self_href },
            statement: { href: "#{self_href}/#{statement_id}" }
          }
        }
      end

      get 'PLACEHOLDER/statements/:id' do
        content_type 'text/csv'

        location = Ledgerdary::Statements::Location.new(
          account: 'PLACEHOLDER',
          id: params[:id])

        IO.read(location.filepath, open_args: ['rb'])
      end
    end
  end
end
