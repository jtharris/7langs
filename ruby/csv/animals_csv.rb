require 'acts_as_csv'

class AnimalsCsv
  include ActsAsCsv
end

AnimalsCsv.new.each do |row|
  puts "1: #{row.one}"
  puts "3: #{row.three}"
end
