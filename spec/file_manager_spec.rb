require 'file_manager'
require 'tempfile'

describe FileManager do
	context 'when legal input file given' do
		before(:each) do
			allow(File).to receive(:readlines).with("./input_files/potato").and_return([" _     _  _  _  _  _     _ \n",
																																									"|_|  ||_| _||_ |_  _||_||_|\n",
																																									"|_|  | _||_ |_||_||_   ||_|\n",
																																									"                             "
																																								])
			@f = FileManager.new('potato')
		end
		context "#initialize" do
			it 'should return FileManager with @output_lines with 1 Line' do
				expect(@f).to be_a FileManager
				expect(@f.instance_variable_get(:@output_lines).all? {|d| d.is_a?(Line)}).to eq true
				expect(@f.instance_variable_get(:@output_lines).size).to eq 1
			end
		end
		context "#write" do
			it 'write to output_spec.txt the invoice number 819266248' do
				File.open("./output_files/output_spec.txt","w"){}
				@f.write("output_spec.txt")
				expect(File.read("./output_files/output_spec.txt")).to eq "819266248\n"
			end
		end
	end

	context 'when illegal input file given' do
		before(:each) do
			allow(File).to receive(:readlines).with("./input_files/potato").and_return([" _     _  _  _  _  _     _ \n",
																																									"|_|  ||_| _||_ |_  _||_||_|\n",
																																									"|_|  | _||_ |_||_||_   ||_|\n",
																																									"                             ",
																																									" _     _  _  _  _  _     _ \n",
																																									"|_|  ||_| _||_ |_  _||_||_|\n",
																																									"|_|  | _||_ |_||_||_    |_|\n",
																																									"                             "
																																								])
			@f = FileManager.new('potato')
		end
		context "#initialize" do
			it 'should return FileManager with @output_lines with 2 Line' do
				expect(@f).to be_a FileManager
				expect(@f.instance_variable_get(:@output_lines).all? {|d| d.is_a?(Line)}).to eq true
				expect(@f.instance_variable_get(:@output_lines).size).to eq 2
			end
		end
		context "#write" do
			it 'write to output_spec.txt 819266248\n' do
				File.open("./output_files/output_spec.txt","w"){}
				@f.write("output_spec.txt")
				expect(File.read("./output_files/output_spec.txt")).to eq "819266248\n8192662?8 ILLEGAL\n"
			end
		end
	end
end
