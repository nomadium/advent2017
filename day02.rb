# https://adventofcode.com/2017/day/2

def checksum_part1(spreadsheet)
  rows = spreadsheet.split("\n").map { |r| r.split.map(&:to_i) }
  row_checksums = rows.map { |r| checksum_row_part1(r) }
  row_checksums.reduce(0, :+)
end

def checksum_row_part1(row)
  row.max - row.min
end

raise unless checksum_part1("5 1 9 5\n7 5 3\n2 4 6 8") == 18

def checksum_part2(spreadsheet)
  rows = spreadsheet.split("\n").map { |r| r.split.map(&:to_i) }
  row_checksums = rows.map { |r| checksum_row_part2(r) }
  row_checksums.reduce(0, :+)
end

def checksum_row_part2(row)
  evenly_divisible_values = []
  sorted_row = row.sort.reverse
  sorted_row.each_with_index do |num,index|
    sorted_row[(index + 1)..-1].each do |n|
      evenly_divisible_values << num << n if (num.to_f % n.to_f).zero?
    end
  end
  raise if evenly_divisible_values.size != 2
  evenly_divisible_values.first / evenly_divisible_values.last
end

raise unless checksum_part2("5 9 2 8\n9 4 7 3\n3 8 6 5") == 9
