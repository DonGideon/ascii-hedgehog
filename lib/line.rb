class Line
	FIRST_LINE = 0

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
			(0...27).step(3).each do |col_i|
				@character_arr << Character.new(seven_segment_char(input_lines, col_i))
			end
		end

		def seven_segment_char(input_lines, col_i)
			seven_segment_arr = []
			seven_segment_arr << input_lines[FIRST_LINE][col_i+1]
			(1..2).each do |r|
				(0...3).each do |c|
					seven_segment_arr << input_lines[r][col_i+c]
				end
			end
			seven_segment_arr
		end

		def illegal?(str)
			str.include?("?")
		end
end