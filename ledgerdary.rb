#!/usr/bin/env ruby

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

puts help
