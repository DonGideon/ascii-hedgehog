require_relative 'line'
require_relative 'character'

class FileManager
	INPUT_LINES_HEIGHT = 3
	EMPTY_LINE_HEIGHT  = 1

	def initialize(input_file_name)
		@output_lines = []
		file = File.readlines("./input_files/#{input_file_name}")
		file.each_slice(INPUT_LINES_HEIGHT+EMPTY_LINE_HEIGHT) do |input_lines|
			@output_lines << Line.new(input_lines.take(INPUT_LINES_HEIGHT)) if input_lines.size >= INPUT_LINES_HEIGHT
		end
	end

	def write(output_file_name)
		File.open("./output_files/#{output_file_name}","a") { |f| @output_lines.each {|l| f.puts(l.to_s)} }
	end
end
