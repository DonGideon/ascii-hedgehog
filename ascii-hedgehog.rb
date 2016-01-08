require "./lib/file_manager"
	
	def parse_file(file_name)
		begin
			file_manager = FileManager.new(file_name)
			file_manager.write(output_name(file_name))
			p "'#{file_name}' was parsed. wow, so fast, much parse, such digits"
		rescue => error
			p "oh no, #{error.inspect}"
		end
	end

	def output_name(input_file_name)
		output_file_name = "output_" + input_file_name.sub("input_", "")
		File.open("./output_files/#{output_file_name}","w"){} if File.exist?("./output_files/#{output_file_name}")
		output_file_name
	end

parse_file(ARGV[0])