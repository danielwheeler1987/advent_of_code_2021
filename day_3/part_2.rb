require 'pry'

input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()

def some_recursive_method(index, lines)
    return lines.first if lines.size == 1

    zero_results = []
    one_results = []

    lines.each do |line|
        split_line_data = line.split ''

        if split_line_data[index] == '0'
            zero_results << line
        else
            one_results << line
        end
    end

    next_lines = zero_results.size > one_results.size ? zero_results : one_results

    some_recursive_method(index + 1, next_lines)
end

def some_recursive_method_two(index, lines)
    return lines.first if lines.size == 1

    zero_results = []
    one_results = []

    lines.each do |line|
        split_line_data = line.split ''

        if split_line_data[index] == '0'
            zero_results << line
        else
            one_results << line
        end
    end

    next_lines = zero_results.size < one_results.size ? zero_results : one_results
    next_lines = zero_results if zero_results.size == one_results.size

    some_recursive_method_two(index + 1, next_lines)
end

oxygen_generator_testing = some_recursive_method(0, input_file_lines)
puts "Oxygen Generator Testing: #{oxygen_generator_testing.to_i(2)}\n"

oxygen_generator_testing = some_recursive_method_two(0, input_file_lines)
puts "Oxygen Generator Testing: #{oxygen_generator_testing.to_i(2)}\n"

# Answer is 4481199 after multiplying the above together
