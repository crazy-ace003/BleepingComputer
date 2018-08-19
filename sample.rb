require_relative 'lib/api'

bc = Bleeping.get(0)
puts"[+] GET BOTH [+]"
puts bc

print"\n"
puts"[+] JUST GET TITLE [+]"
bc = Bleeping.Title
puts bc
puts

print"\n"

puts"[+] JUST GET LINK [+]"
bc = Bleeping.Title(1)
puts bc
print"\n"

puts"[+] GET DATE [+]"
bc = Bleeping.Date(1)
puts bc
print"\n"

puts"[+] GET SUMMARY [+]"
bc = Bleeping.Summary
puts bc 
print"\n"

puts"[+] TIME [+]"
bc = Bleeping.Time(1)
puts bc
print"\n"

puts"[+] AUTHOR [+]"
bc = Bleeping.Author(1)
puts bc
print"\n"

puts"[+] ALL [+]"
bc = Bleeping.BleepingComputer(1)
puts bc
puts bc['Title']