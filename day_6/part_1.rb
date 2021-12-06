require 'pry'

def total_fish_count(total_days: 80, input_file: 'input.txt')
    fish_counts = File.read(input_file)
        .split(',')
        .map &:to_i

    0.step(total_days - 1) do |outer_index|
        fish_counts.each_with_index do |fish_count, index|
            if fish_counts[index] == 0
                fish_counts[index] = 6
                fish_counts << 9
            else
                fish_counts[index] = fish_counts[index] - 1
            end
        end
    end

    puts "Total lanternfish count after #{total_days} days: #{fish_counts.count}\n"
end

puts "Sample Data\n"
puts "-----------------\n"
total_fish_count(total_days: 18, input_file: 'sample_input.txt')
# Answer is 26

puts "\nPart 1\n"
puts "-----------------\n"
total_fish_count()
# Answer is 380612


