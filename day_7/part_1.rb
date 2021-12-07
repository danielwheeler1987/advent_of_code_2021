input_text_file = 'test_input.txt'

class FuelCost
    attr_reader :position, :list

    def initialize(position:, list:)
        @position = position
        @list = list
    end

    def steps
        list.inject([]) do |memo, list_position|
            memo << (list_position - position).abs
            memo
        end
    end
end

positions = File.read(input_text_file).split(',').map &:to_i

all_steps = positions.each_with_index.inject([]) do |memo, (value, index)|
    steps = FuelCost.new(position: index + 1, list: positions).steps
    memo << steps.sum
    memo
end

puts "The cheapest possible outcome is: #{all_steps.min}\n"
puts "The position of the cheapest possible outcome is: #{all_steps.index(all_steps.min) + 1} \n"
# The cheapest possible outcome is: 355592
# The position of the cheapest possible outcome is: 349 
