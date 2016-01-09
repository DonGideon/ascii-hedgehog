require 'file_manager'

describe Character do
	describe '#initialize' do
		context 'when valid 7 segment is given' do
			it "should return a Character with @char == '0'" do
				c = Character.new(["_","|"," ","|","|","_","|"])
				expect(c).to be_a Character
				expect(c.instance_variable_get(:@char)).to eq "0"
				expect(c.to_s).to eq "0"
			end
		end
		context 'when invalid 7 segment is given' do
			it "should return a Character with @char == '?'" do
				c = Character.new(["_"," "," "," ","|","_","|"])
				expect(c).to be_a Character
				expect(c.instance_variable_get(:@char)).to eq "?"
				expect(c.to_s).to eq "?"
			end
		end
	end
end
