require 'csv'

table = CSV.parse(File.read("test.csv"), headers: false)

entries = Hash.new(0)
table.each do |r|
    rest = r[1..4].sort.join('-')
    entries["#{r[0]}-#{rest}"] += 1
end

entries.map { |k,v| puts k if v > 1 }
