require_relative 'line'
require_relative 'character'

class FileManager

	def initialize(input_file_name)
		@output_lines = []
		output_file_name = reseat_output(input_file_name)
		file = File.readlines("./input_files/#{input_file_name}")
		file.step(4).each_with_index do |input_line, i|
			@output_lines << Line.new([file[i], file[i+1], file[i+2]])
		end
	end

	def write(output_file_name)
		File.open("./output_files/#{output_file_name}","a") { |f| @output_lines.each {|l| f.puts(l.to_s)} }
	end

	private

		def reseat_output(input_file_name)
			output_file_name = "output_" + input_file_name.sub("input_", "")
			File.open("./output_files/#{output_file_name}","w"){} if File.exist?("./output_files/#{output_file_name}")
			output_file_name
		end

		def write_line(line, output_file_name)
			line.convert_input_lines_to_output
			File.open("./output_files/#{output_file_name}","a") { |f| f.puts(line.to_s) }
		end

		def create_or_add_line(output_line, input_line, should_create)
			output_line = Line.new if should_create
			output_line.add_input_line input_line
			output_line
		end

end
