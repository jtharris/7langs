
filename = ARGV[0]
search_string = ARGV[1]

File.readlines(filename).each_with_index do |line, i|
  puts "#{i}:  #{line}" if line =~ /#{search_string}/
end
