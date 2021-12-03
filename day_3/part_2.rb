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

all_rows.each do |row|
    puts row
end
