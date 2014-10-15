require 'spec_helper'

require 'ledgerdary/api/accounts'

module Ledgerdary
  module API
    describe Accounts do
      include Rack::Test::Methods

      def app
        Ledgerdary::API::Accounts
      end

      describe 'POST placeholder/statements' do
        let(:store) do
          instance_double(Ledgerdary::Statements::Store, store: 'statement_id')
        end

        before do
          allow(Ledgerdary::Statements::Store).to receive(:new) { store }
        end

        it 'returns json containing links for self and statement' do
          post 'PLACEHOLDER/statements', 'file' => { 'tempfile' => :tempfile }

          expect(JSON.parse(last_response.body)['_links']['self']['href']).to \
            eq('/PLACEHOLDER/statements')

          expect(JSON.parse(last_response.body)['_links'] \
                ['statement']['href']).to \
            eq('/PLACEHOLDER/statements/statement_id')
        end
      end

    end
  end
end
