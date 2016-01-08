class Character
		7_SEGMENT_TO_DECIMAL = {
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

	def initialize(7_segment)
		@char = char
	end

	def to_s
		@char
	end
end