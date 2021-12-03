input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()

def determine_rating(index, lines, &block)
    return lines.first if lines.size == 1

    zero_results = []
    one_results = []

    lines.each do |line|
        split_line_data = line.split ''
        
        zero_results << line if split_line_data[index] == '0'
        one_results << line if split_line_data[index] == '1'
    end

    next_lines =  yield(zero_results, one_results) if block_given?
    determine_rating(index + 1, next_lines, &block)
end

oxygen_generator_testing = determine_rating(0, input_file_lines) do |zero_results, one_results|
    zero_results.size > one_results.size ? zero_results : one_results
end
puts "Oxygen generator testing: #{oxygen_generator_testing.to_i(2)}\n"

co2_scrubber_rating = determine_rating(0, input_file_lines) do |zero_results, one_results|
    next_lines = zero_results.size < one_results.size ? zero_results : one_results
    next_lines = zero_results if zero_results.size == one_results.size
    next_lines
end
puts "CO2 scrubber rating: #{co2_scrubber_rating.to_i(2)}\n"

puts "Life support rating: #{oxygen_generator_testing.to_i(2) * co2_scrubber_rating.to_i(2)}\n"
# Answer is 4481199 after multiplying the above together
