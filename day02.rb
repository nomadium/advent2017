# https://adventofcode.com/2017/day/2

def checksum(spreadsheet)
  rows = spreadsheet.split("\n")
  row_checksums = rows.map { |r| r.split.map(&:to_i) }.map { |q| checksum_row(q) }
  row_checksums.reduce(0, :+)
end

def checksum_row(row)
  row.max - row.min
end

raise unless checksum("5 1 9 5\n7 5 3\n2 4 6 8") == 18
