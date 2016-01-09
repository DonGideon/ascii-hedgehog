require 'file_manager'

describe Line do
	describe '#initialize' do
		context 'when legal input lines is given' do
			before(:each) do
				@l = Line.new([
												 " _     _  _  _  _  _     _ \n",
												 "|_|  ||_| _||_ |_  _||_||_|\n",
												 "|_|  | _||_ |_||_||_   ||_|\n"
												])
			end

			it "should return a Line with @character_arr have 9 Character" do
				expect(@l).to be_a Line
				expect(@l.instance_variable_get(:@character_arr).all? {|d| d.is_a?(Character)}).to eq true
				expect(@l.instance_variable_get(:@character_arr).size).to eq 9
			end

			it "should return '819266248' when to_s" do
				expect(@l.to_s).to eq '819266248'
			end
		end

		context 'when illegal input lines is given' do
			before(:each) do
				@l = Line.new([
												 " _     _  _  _  _  _     _ \n",
												 "|_|  ||_| _||_ |_  _||_||_|\n",
												 "|_|  | _||_ |_ |_||_   ||_|\n"
												])
			end

			it "should return a Line with @character_arr have 9 Character" do
				expect(@l).to be_a Line
				expect(@l.instance_variable_get(:@character_arr).all? {|d| d.is_a?(Character)}).to eq true
				expect(@l.instance_variable_get(:@character_arr).size).to eq 9
			end

			it "should return '8192?6248 ILLEGAL' when to_s" do
				expect(@l.to_s).to eq '8192?6248 ILLEGAL'
			end
		end
	end
end
