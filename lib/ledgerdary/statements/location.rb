require 'fileutils'
require 'time'

module Ledgerdary::Statements
  class Location
    STATEMENT_ROOT = File.join('/', 'srv', 'ledgerdary', 'statements')

    attr_reader :filepath, :id

    def initialize(account_id)
      @id = Time.now.utc.iso8601
      @filepath = File.join(Location.directory(account_id), @id)
    end

    private

    def self.directory(account_id)
      dir = File.join(STATEMENT_ROOT, account_id)
      FileUtils.mkdir(dir) unless Dir.exist?(dir)
      dir
    end
  end
end
