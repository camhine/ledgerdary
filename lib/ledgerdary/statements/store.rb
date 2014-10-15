require 'time'

require 'ledgerdary/statements/location'

module Ledgerdary::Statements
  class Store
    def initialize(account_id)
      @account_id = account_id
    end

    def store(tempfile)
      location = Location.new(account_id)
      IO.copy_stream(tempfile, location.filepath)
      location.id
    end

    private

    attr_reader :account_id
  end
end
