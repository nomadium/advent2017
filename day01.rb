# http://adventofcode.com/2017/day/1

def captcha_part1(num)
  result = 0
  num_as_str = num.to_s
  num_as_str.chars.each_with_index do |digit,index|
    if num_as_str[index - 1] == num_as_str[index]
      result += digit.to_i
    end
  end
  result
end

raise "case 1" unless captcha_part1(1122)     == 3
raise "case 2" unless captcha_part1(1111)     == 4
raise "case 3" unless captcha_part1(1234)     == 0
raise "case 4" unless captcha_part1(91212129) == 9

def captcha_part2(num)
  result = 0
  num_as_str = num.to_s
  num_length = num_as_str.length
  num_as_str.chars.each_with_index do |_,index|
    idx = index - 1
    idx_halfway_around = idx + num_length / 2
    if idx_halfway_around >= num_length
      idx_halfway_around = idx_halfway_around % num_length
    end
    if num_as_str[idx] == num_as_str[idx_halfway_around]
      result += num_as_str[idx].to_i
    end
  end
  result
end

raise "case 1" unless captcha_part2(1212)     == 6
raise "case 2" unless captcha_part2(1221)     == 0
raise "case 3" unless captcha_part2(123425)   == 4
raise "case 4" unless captcha_part2(123123)   == 12
raise "case 5" unless captcha_part2(12131415) == 4
