
module ActsAsCsv

  attr_accessor :headers, :contents

  def initialize
    # I changed a lot of stuff from the book, but this
    # is the way that they set it up
    read
  end

  def read
    @contents = []
    filename = self.class.to_s.downcase + '.txt'
    file = File.new filename
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @contents << row.chomp.split(', ')
    end
  end

  def each
    @contents.each do |row|
      yield CsvRow.new(@headers, row)
    end
  end

end

class CsvRow

  def initialize(headers, row)
    # I feel like there should be a more idiomatic way
    # to do this...
    @row_hash = {}
    headers.zip(row).each do |pair|
      @row_hash[pair.first] = pair.last
    end
  end

  # OpenStruct might be a better way to do this, but I 
  # will go along with the lesson to focus on method_missing
  def method_missing(method)
    @row_hash[method.to_s] rescue super
  end
end
