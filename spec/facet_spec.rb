require_relative '../objects/facet'
require_relative '../objects/vertext'
require_relative '../objects/triangle'
require 'pry'
require 'bigdecimal'

describe Facet do
  
  vertext_1 = Vertext.new(BigDecimal.new(0), BigDecimal.new(0), BigDecimal.new(0))
  vertext_2 = Vertext.new(BigDecimal.new(1), BigDecimal.new(0), BigDecimal.new(0))
  vertext_3 = Vertext.new(BigDecimal.new(1), BigDecimal.new(1), BigDecimal.new(1))
  triangle = Triangle.new(BigDecimal.new(1),BigDecimal.new(1),BigDecimal.new(1))

  facet = Facet.new(triangle, vertext_1, vertext_2, vertext_3)

  context "object instantiation" do
    
    it "will assign the first value passed to it" do
      expect(facet.normal.class).to eq(Triangle)
    end

    it "will assign the rest of the values passed to it" do
      expect(facet.vertices.length).to eq(3)
    end

  end

  describe ".area" do
    
    it "will calculate the area of the vertices" do
      expect(facet.area).to eq(0.7071067811865478)
    end

  end
end
