require 'time'

require 'ledgerdary/statements/location'

module Ledgerdary
  module Statements
    class Store
      def initialize(account)
        @account = account
      end

      def store(tempfile)
        location = Location.new(account: account)
        IO.copy_stream(tempfile, location.filepath)
        location.id
      end

      private

      attr_reader :account
    end
  end
end
