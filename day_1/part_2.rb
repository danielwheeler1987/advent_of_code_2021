count = 0
last_sum_of_measurements = nil

input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()
lines = []

for line in input_file_lines
    lines << line.to_i
end

lines.each_with_index do |line, index|
    break if lines[index + 2].nil?

    sum_of_measurements = lines[index..index + 2].sum

    if last_sum_of_measurements.nil?
        last_sum_of_measurements = sum_of_measurements
        next
    end

    count += 1 if last_sum_of_measurements < sum_of_measurements
    last_sum_of_measurements = sum_of_measurements
end

puts count
# Answer is 1653
