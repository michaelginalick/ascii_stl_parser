require_relative '../objects/surface_area'

describe SurfaceArea do

  describe ".calculate" do

    it "will sum the array of numbers" do
      expect(SurfaceArea.calculate([45.2, 45.3, 45.1])). to eq(135.6)
    end

    it "will round to 4 decimal places" do
      expect(SurfaceArea.calculate([45.23472, 45.12343, 45.198736])). to eq(135.5569)
    end

  end

end
