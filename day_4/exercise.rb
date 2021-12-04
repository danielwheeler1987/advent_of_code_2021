require 'matrix'
require 'pry'

class BingoBoard
    attr_reader :board, :board_data, :board_number, :last_number_called

    MARKED_FOUND = 'X'.freeze

    def initialize(board_data, board_number)
        @board_data = board_data
        @board_number = board_number
        @last_number_called = nil
        @winners = []
        @board = nil
    end

    def build
        @board = board_data.split(' ').each_slice(5).to_a
    end

    def update!(random_number)
        board_index = Matrix[*board].index random_number
        
        return unless board_index

        board_x = board_index.first
        board_y = board_index.last

        board[board_x][board_y] = MARKED_FOUND
        @last_number_called = random_number.to_i
    end

    def winner?
        if board.any? { |row| row.all? { |value| value == MARKED_FOUND } } 
            return true 
        end
        
        if board.transpose.any? { |row| row.all? { |value| value == MARKED_FOUND } }
            return true
        end

        false
    end

    def calculate_score
        flattened_board = board.flatten
        flattened_board.delete MARKED_FOUND

        sum_of_unmarked_values = flattened_board.map.inject(0) do |sum, value|
            sum += value.to_i
            sum
        end

        sum_of_unmarked_values * last_number_called
    end
end

input_file = File.open('input.txt', 'r')
input_file_lines = input_file.readlines()

random_numbers = input_file_lines.first
input_file_lines = input_file_lines.drop 2
input_file_lines.delete "\n"
sliced_input_files_lines = input_file_lines.each_slice(5).to_a

board_instances = []
sliced_input_files_lines.each_with_index do |board_data, index|
    formatted_board_data = board_data.join.gsub("\n",' ').gsub('  ', ' ')
    board_number = index + 1

    board_instance = BingoBoard.new(formatted_board_data, board_number)
    board_instance.build
    board_instances << board_instance
end

random_numbers = random_numbers.split ','

puts "Part 1\n"
puts "--------------------\n\n"

random_numbers.each do |random_number|
    break unless board_instances.each do |board_instance|
        board_instance.update! random_number
        if board_instance.winner?
            puts "Bingo Board # #{board_instance.board_number} is the winner!!!\n"
            puts "The score of the winning board is: #{board_instance.calculate_score}\n"
            break
        end
    end
end
# Answer is 23177

puts "\n\nPart 2\n"
puts "--------------------\n\n"

remaing_board_numbers = Array(1..board_instances.size)
last_score = nil

random_numbers.each do |random_number|
    break unless board_instances.each_with_index do |board_instance, index|
        board_instance.update! random_number

        if board_instance.winner?
            board_number = board_instance.board_number
            next unless remaing_board_numbers.include? board_number

            last_score = board_instance.calculate_score
            remaing_board_numbers.delete board_number
        end
    end
end

puts "The score of the last winning board is: #{last_score}\n"
