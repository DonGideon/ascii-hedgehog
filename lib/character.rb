class Character
		SEVEN_SEGMENT_TO_DECIMAL = {
			"1101111" => "0",
			"0001001" => "1",
			"1011110" => "2",
			"1011011" => "3",
			"0111001" => "4",
			"1110011" => "5",
			"1110111" => "6",
			"1001001" => "7",
			"1111111" => "8",
			"1111011" => "9"
		}
		ILEGAL_CHARACTER = "?"

	def initialize(seven_segment_arr)
		@char = SEVEN_SEGMENT_TO_DECIMAL[seven_segment_binary(seven_segment_arr)] || ILEGAL_CHARACTER
	end

	def to_s
		@char
	end

	private

		def seven_segment_binary(char_arr)
			char_arr.inject(""){|seven_segment, c| seven_segment << char_space?(c); seven_segment}
		end

		def char_space?(char)
			char == " " ? "0" : "1"
		end
end