input_text_file = File.open('input.txt', 'r')
positions = []

horizontal_position = 0
depth_position = 0
aim_positon = 0

Position = Struct.new(:direction_name, :direction_count)

for line in input_text_file.readlines()
    line_data = line.split(' ')
    position = Position.new(line_data.first, line_data.last.to_i)
    positions << position
end

positions.each do |position|   
    case position.direction_name
    when 'up'
        aim_positon -= position.direction_count
    when 'down'
        aim_positon += position.direction_count
    else
        depth_position += (position.direction_count * aim_positon)        
        horizontal_position += position.direction_count
    end
end

puts "Final Position: #{horizontal_position * depth_position}"
# Answer is 1842742223 (1939 * 950357)
