input_text_file = File.open('input.txt', 'r')
positions = []

@@horizontal_position = 0
@@depth_position = 0

Position = Struct.new(:direction_name, :direction_count)

class ChangePositionBase
    attr_reader :direction_name, :direction_count

    def initialize(position)
        @direction_name = position.direction_name
        @direction_count = position.direction_count
    end

    def change
        raise('Implement is subclass!!!')
    end
end


class ChangePositonUp < ChangePositionBase
    def change
        @@depth_position -= direction_count
    end
end

class ChangePositionDown < ChangePositionBase
    def change
        @@depth_position += direction_count
    end
end

class ChangePositionForward < ChangePositionBase
    def change
        @@horizontal_position += direction_count
    end
end

class ChangePositionFactory
    def initialize(position)
        @position = position
    end

    # Use a hash instead of the switch
    def change
        case @position.direction_name
        when 'up'
            ChangePositonUp.new(@position).change
        when 'down'
            ChangePositionDown.new(@position).change
        else
            ChangePositionForward.new(@position).change
        end
    end
end

for line in input_text_file.readlines()
    line_data = line.split(' ')
    position = Position.new(line_data.first, line_data.last.to_i)
    positions << position
end

positions.each { |position| ChangePositionFactory.new(position).change }

puts "Final Position: #{@@horizontal_position * @@depth_position}"
# Answer is 2150351 (1939 * 1109)
