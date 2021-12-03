input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()
lines = []

# This is trash.. Need to make this dynamic
row_1 = []
row_2 = []
row_3 = []
row_4 = []
row_5 = []
row_6 = []
row_7 = []
row_8 = []
row_9 = []
row_10 = []
row_11 = []
row_12 = []

for line in input_file_lines
    row_data = line.split ''
    
    row_1 << row_data[0]
    row_2 << row_data[1]
    row_3 << row_data[2]
    row_4 << row_data[3]
    row_5 << row_data[4]
    row_6 << row_data[5]
    row_7 << row_data[6]
    row_8 << row_data[7]
    row_9 << row_data[8]
    row_10 << row_data[9]
    row_11 << row_data[10]
    row_12 << row_data[11]
end

all_rows = [row_1, row_2, row_3, row_4, row_5, row_6, row_7, row_8, row_9, row_10, row_11, row_12]
gama_rate = []
eplison_rate = []

all_rows.each do |row|
    zero_counter, one_counter = row.inject(Hash.new(0)) do |hash,value|
        hash[value] += 1
        hash
    end.values_at('0', '1')

    if zero_counter > one_counter
        gama_rate << 0
        eplison_rate << 1
    else
        gama_rate << 1
        eplison_rate << 0
    end
end

gama_rate = gama_rate.join('').to_i(2)
eplison_rate = eplison_rate.join('').to_i(2)

puts "Gama rate: #{gama_rate}\n"
puts "Eplisom rate: #{eplison_rate}\n"
puts "What is the power consumption of the submarine? The answer is : #{gama_rate * eplison_rate}"
# Answer is 3320834

