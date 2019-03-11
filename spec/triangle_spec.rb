require_relative '../objects/triangle'

describe Triangle do
  
  triangle = Triangle.new(7.0, 3.9, 4.0)

  context "object instantiation" do
    
    it "will assign the first value passed to it" do
      expect(triangle.point_a).to eq(7.0)
    end

    it "will assign the second value passed to it" do
      expect(triangle.point_b).to eq(3.9)
    end

    it "will assign the third value passed to it" do
      expect(triangle.point_c).to eq(4.0)
    end

  end

end
