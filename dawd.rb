puts "Hur många högar vill du spela med? (3-7)"
heaps = gets.chomp.to_i

while heaps < 3 || heaps > 7
    puts "Välj mellan 3 till 7 högar"
    heaps = gets.chomp.to_i
end


lowest_heap = heaps * 2 - 1
sticks = [lowest_heap]

i = 1
while i < heaps
    sticks.append(lowest_heap - 2 * i)
    i += 1
end

print(sticks)