require_relative 'line'
require_relative 'character'

class FileManager

	def initialize(input_file_name)
		@output_lines = []
		file = File.readlines("./input_files/#{input_file_name}")
		file.each_slice(4) do |input_lines|
			@output_lines << Line.new([input_lines[0], input_lines[1], input_lines[2]])
		end
	end

	def write(output_file_name)
		File.open("./output_files/#{output_file_name}","a") { |f| @output_lines.each {|l| f.puts(l.to_s)} }
	end

	private

		

end
