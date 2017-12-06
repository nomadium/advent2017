# http://adventofcode.com/2017/day/1

def captcha(num)
  result = 0
  num_s = num.to_s
  num_s.chars.each_with_index do |digit,index|
    if num_s[index - 1] == num_s[index]
      result += digit.to_i
    end
  end
  result
end

abort "case 1" unless captcha(1122)     == 3
abort "case 2" unless captcha(1111)     == 4
abort "case 3" unless captcha(1234)     == 0
abort "case 4" unless captcha(91212129) == 9
