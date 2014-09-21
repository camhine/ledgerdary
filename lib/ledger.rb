require 'entry'

class Ledger
  def initialize(data_file)
    lines = []
    File.open(data_file) do |file|
      lines = file.readlines
    end

    entry_repository = EntryRepository.new

    Ledger.entry_data(lines) do |data|
      entry_repository.add(Entry.from_array(data))
    end
  end

  def ledger_data
    entry_repository.entry_log do |entry|
      puts entry
    end
  end

  def reconcile!(transaction_log)
    

    missing_transactions = transaction_log.select do |transaction|
      entry_repository.find(transaction) ? false : true
    end

    missing_transactions.each do |transaction|
      entry_repository.add(Enrty.from_transaction(transaction))
    end

    self
  end

  private

  attr_accessor :entry_repository

  def self.entry_data(lines)
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
