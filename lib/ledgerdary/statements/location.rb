require 'fileutils'
require 'time'

module Ledgerdary
  module Statements
    class Location
      STATEMENT_ROOT = File.join('/', 'srv', 'ledgerdary', 'statements')

      attr_reader :filepath, :id

      def initialize(account:, id: Time.now.utc.iso8601)
        @id       = id
        @filepath = File.join(directory(account), @id)
      end

      private

      def directory(account)
        dir = File.join(STATEMENT_ROOT, account)
        FileUtils.mkdir(dir) unless Dir.exist?(dir)
        dir
      end
    end
  end
end
