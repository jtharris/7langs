
def printed_list(list)
  num_list = list.inject('') {|l, num| l.empty? ? num.to_s : "#{l}, #{num}"}
  "[#{num_list}]"
end

nums = Array.new(16) { rand(10) }
puts "Generated numbers:  #{printed_list(nums)}"

puts '-------------------------- each() --------------------------------------------'
current = []
nums.each do |num|
  current << num

  if current.length == 4
    puts printed_list current
    current = []
  end
end

puts '-------------------------- each_slice() ---------------------------------------'
nums.each_slice(4) do |group|
  puts printed_list group
end
