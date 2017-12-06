# https://adventofcode.com/2017/day/4

def valid?(passphrase, anagram_check: false)
  words = passphrase.split
  conditions = []
  conditions << (words.length == words.uniq.length)
  conditions << !anagrams?(words) if anagram_check
  conditions.reduce(true, :&)
end

def valid_passphrases_number(passphrases)
  passphrases.map { |p| valid?(p) }.count(true)
end

# required for part 2 of the challenge
# approach from: https://stackoverflow.com/a/55250
def anagrams?(words)
  roots = {}
  words.each do |w|
    k = w.chars.sort.join
    roots[k] = roots.fetch(k, 0) + 1
  end
  roots.values.any? { |v| v >= 2 }
end

raise unless  valid?("aa bb cc dd ee")
raise     if  valid?("aa bb cc dd aa")
raise unless valid?("aa bb cc dd aaa")
