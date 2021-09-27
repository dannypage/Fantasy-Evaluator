require 'csv'

table = CSV.parse(File.read("mnf.csv"), headers: true)

a=[]
table.each do |row|
    a.push({
        name: row['PLAYER'],
        salary: row['SAL'].to_i,
        pts: row['Avg'].to_f
    })
end

combos = a.combination(5).to_a

filtered_combos = []

combos.each do |c|
    salary = c.sum {|h| h[:salary] }
    points = c.sum {|h| h[:pts] }
    
    if salary >= 55000 and salary <= 60000 and points > 70
        filtered_combos.push(c)
        puts c
        puts '----'
    end
end


