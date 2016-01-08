class Line
	FIRST_LINE = 0
	SECOND_LINE = 1
	THIRD_LINE = 2
	NUM_OF_INPUT_LINES = 3
	INPUT_LINE_LENGTH = 27

	def initialize(input_lines)
		@character_arr = []
		input_lines_to_characters(input_lines)
	end

	def to_s
		str = @character_arr.join()
		str += " ILLEGAL" if illegal?(str)
		str
	end

	private

		def input_lines_to_characters(input_lines)
			(0...INPUT_LINE_LENGTH).step(NUM_OF_INPUT_LINES).each do |col_i|
				@character_arr << Character.new(seven_segment_char(input_lines, col_i))
			end
		end

		def seven_segment_char(input_lines, col_i)
			seven_segment_arr = []
			seven_segment_arr << input_lines[FIRST_LINE][col_i+1]
			(SECOND_LINE..THIRD_LINE).each do |r|
				(0...3).each do |c|
					seven_segment_arr << input_lines[r][col_i+c]
				end
			end
			seven_segment_arr
		end

		def illegal?(str)
			str.include?(Character::ILEGAL_CHARACTER)
		end
end