require_relative '../objects/bounding_box'
require_relative '../objects/vertext'

describe BoundingBox do

  context "object instantiation" do
    
    vertext = Vertext.new(7.0, 3.9, 4.0)
    bounded_box = BoundingBox.new([vertext])
    
    it "will assign the vertext x values" do
      expect(bounded_box.x_values).to eq([7.0])
    end

    it "will assign the vertext y values" do
      expect(bounded_box.y_values).to eq([3.9])
    end

    it "will assign the vertext z values" do
      expect(bounded_box.z_values).to eq([4.0])
    end

  end

  describe "to_a" do
    vertext = Vertext.new(7.0, 3.9, 4.0)
    vertext_1 = Vertext.new(9.0, 5.9, 2.0)
    vertext_2 = Vertext.new(1.0, 1.0, 1.0)
    bounded_box = BoundingBox.new([vertext, vertext_1, vertext_2])

    it "will return an array of hashes" do
      expect(bounded_box.to_a.length).to eq(2)
    end

    it "will assign min values to the first hash" do
      expect(bounded_box.to_a.first[:x]).to eq(1.0)
      expect(bounded_box.to_a.first[:y]).to eq(1.0)
      expect(bounded_box.to_a.first[:z]).to eq(1.0)
    end

    it "will assign min values to the first hash" do
      expect(bounded_box.to_a.last[:x]).to eq(9.0)
      expect(bounded_box.to_a.last[:y]).to eq(5.9)
      expect(bounded_box.to_a.last[:z]).to eq(4.0)
    end

  end

end
