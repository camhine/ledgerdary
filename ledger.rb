require 'entry'

class Ledger
  def initialize(data_file)
    lines = []
    File.open(data_file) do |file|
      lines = file.readlines
    end

    @entries = []
    entry_data(lines) do |data|
      @entries << Entry.new(data)
    end
  end

  def ledger_data
  end

  def reconcile!(transaction_log)
    self
  end

  private

  def entry_data(lines)
    entry = []
    lines.each do |line|
      unless line.chomp.empty?
        entry << line
      else
        yield entry
        entry = []
      end
    end
  end
end
