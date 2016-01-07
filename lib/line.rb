class Line

	def initialize 
		@input_lines = []
		@character_arr = []
	end

	def add_input_line(input_line)
		@input_lines << input_line
	end

	def convert_input_lines_to_output
		input_lines_to_characters
	end

	def to_s
		str = @character_arr.join()
		str += " ILLEGAL" if is_illegal?
		str
	end

	private

		def input_lines_to_characters
			(0...27).step(3).each do |col_i|
				new_character(input_lines_to_character(col_i))
			end
		end

		def input_lines_to_character(col_i)
			binary_string = ""
			binary_string << empty_string_to_binary(@input_lines[0][col_i+1])
			(1..2).each do |r|
				(0...3).each do |c|
					binary_string << empty_string_to_binary(@input_lines[r][col_i+c])
				end
			end
			binary_string
		end

		def empty_string_to_binary(str)
			str.strip.length == 0 ? "0" : "1"
		end

		def new_character(binary_str)
			@character_arr << CharacterFactory.character_from_binary(binary_str)
		end

		def is_illegal?
			@character_arr.any? {|c| c.is_a?(IllegalCharacter)}
		end
end