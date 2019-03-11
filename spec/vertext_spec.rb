require_relative '../objects/vertext'

describe Vertext do
  
  vertext = Vertext.new(7.0, 3.9, 4.0)

  context "object instantiation" do
    
    it "will assign the first value passed to it" do
      expect(vertext.x).to eq(7.0)
    end

    it "will assign the second value passed to it" do
      expect(vertext.y).to eq(3.9)
    end

    it "will assign the third value passed to it" do
      expect(vertext.z).to eq(4.0)
    end

  end

end
