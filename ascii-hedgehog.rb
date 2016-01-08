require "./lib/file_manager"
class AsciiHedgehog
	def self.parse(file_name)
		begin
			FileManager.new(file_name, "a")
			p "'#{file_name}' was parsed. wow, so fast, much parse, such digits"
		rescue => error
			p "oh no, #{error.inspect}"
		end
	end

			def reseat_output(input_file_name)
			output_file_name = "output_" + input_file_name.sub("input_", "")
			File.open("./output_files/#{output_file_name}","w"){} if File.exist?("./output_files/#{output_file_name}")
			output_file_name
		end
end

AsciiHedgehog.parse(ARGV[0])