count = 0
last = nil

input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()
lines = []

for line in input_file_lines
    lines << line.to_i
end

lines.each do |line|
    line_as_number = line.to_i

    if last.nil?
        last = line_as_number
        next
    end

    if line_as_number > last
        count += 1
    end
    
    last = line_as_number
end

puts count
# Answer is 1624
