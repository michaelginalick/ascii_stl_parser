require_relative '../objects/ascii_model'
require_relative '../errors/disallowed_file_type'

describe AsciiModel do
  
  bad_file = File.open('./files/challenge.md')
  good_file = File.open('./files/simple.stl')

  context "object instantiation" do
    
    context "errors" do
      it "will raise error" do
        expect { AsciiModel.new(bad_file) }.to raise_error(DisallowedFileType)
      end
    end

    it "will assign the file passed in" do
      new_model = AsciiModel.new(good_file)
      expect(new_model.model.class).to eq(Array)
    end
  end


  describe ".analyze" do
    
    it "will return the expected hash" do
      new_model = AsciiModel.new(good_file)
      expected_keys = [:number_of_triangles, :surface_area, :bounding_box]
      expect(new_model.analyze.keys).to eq(expected_keys)
    end

    it "will assign the correct values to number_of_triangle key" do
      new_model = AsciiModel.new(good_file)
      expect(new_model.analyze[:number_of_triangles]).to eq(2)
    end

    it "will assign the correct values to surface_area key" do
      new_model = AsciiModel.new(good_file)
      expect(new_model.analyze[:surface_area]).to eq(1.4142)
    end

    it "will assign the correct values to bounding_box key" do
      new_model = AsciiModel.new(good_file)
      expected = [{:x=>0.0, :y=>0.0, :z=>0.0}, {:x=>1.0, :y=>1.0, :z=>1.0}]
      expect(new_model.analyze[:bounding_box]).to eq(expected)
    end

  end

  describe ".extract_data" do
    it "will return each facet from the file" do
      new_model = AsciiModel.new(good_file)
      new_model.extract_data.each do |model|
        expect(model.class).to eq(Facet)
      end
    end

    it "will assign exactly 3 vertices to each facet" do
      new_model = AsciiModel.new(good_file)
      new_model.extract_data.each do |model|
        expect(model.vertices.size).to eq(3)
      end
    end

    it "will assign the normal attribute to each facet as a Triangle" do
      new_model = AsciiModel.new(good_file)
      new_model.extract_data.each do |model|
        expect(model.normal.class).to eq(Triangle)
      end
    end

  end

end
