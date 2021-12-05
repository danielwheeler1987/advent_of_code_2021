def range a, b
  a < b ? (a..b) : a.downto(b)
end

def part_1
  coordinates = File.readlines("input.txt")
    .map(&:chomp)
    .map{|line| line.split(" -> ")}
    .map{|points| points.map{|point| point.split(",").map(&:to_i)}}
    .select {|(x1,y1),(x2,y2)| x1 == x2 || y1 == y2}
  max = coordinates.flatten.max + 1
  grid = Array.new(max){Array.new(max, 0)}

  coordinates.each do |(x1,y1), (x2,y2)|
    if x1 == x2
      range(y1,y2).each do |y|
        grid[y][x1] += 1
      end
    else
      range(x1,x2).each do |x|
        grid[y1][x] += 1
      end
    end
  end

  grid.flatten.count { |n| n >= 2 }
end

def part_2
  coordinates = File.readlines("input.txt")
    .map(&:chomp)
    .map{|line| line.split(" -> ")}
    .map{|points| points.map{|point| point.split(",").map(&:to_i)}}
    .select {|(x1,y1),(x2,y2)| x1 != x2 && y1 != y2}
  max = coordinates.flatten.max + 1
  grid = Array.new(max){Array.new(max, 0)}

  coordinates.each do |(x1,y1), (x2,y2)|
      range(x1,x2).zip(range(y1, y2)).each do |x,y|
        grid[y][x] += 1
      end
  end

  grid.flatten.count { |n| n >= 2 }
end

puts "Answer to Part 1 is: #{part_1}\n"
puts "Answer to Part 2 is: #{part_2}\n"
