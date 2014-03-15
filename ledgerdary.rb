#!/usr/bin/env ruby

$LOAD_PATH << './'

require 'ledger'
require 'transaction_log'

def help
  <<END
usage: ledgerdary [-h] CSV_FILE LEDGER_FILE

Ledgerdary merges/reconciles ledger data files with transaction
information provided by financial institutions. Account transactions
described by CSV file are merged with ledger data files producting a
new ledger data file (to stdout) contatining untracked expenses from
the CSV.
END
end

ERR_BAD_ARGS = 1

def print_help_and_exit
  puts help
  exit(ARGV[0] == '-h' ? 0 : ERR_BAD_ARGS)
end

def exists_and_readable?(file_path)
  File.exists?(file_path) && File.readable?(file_path)
end

case ARGV.length
when 2
  csv_file    = ARGV.shift
  ledger_file = ARGV.shift
  print_help_and_exit unless exists_and_readable?(csv_file) && exists_and_readable?(ledger_file)
else
  print_help_and_exit
end

puts Ledger.new(ledger_file).reconcile!(TransactionLog.new(csv_file)).ledger_data
