require 'bigdecimal'
require_relative 'triangle'
require_relative 'vertext'
require_relative 'facet'
require_relative 'bounding_box'
require_relative 'surface_area'
require_relative '../errors/disallowed_file_type'

class AsciiModel

  ALLOWED_FILE_EXTENSIONS = [".stl"]

  attr_reader :model
  
  def initialize(model)
    raise DisallowedFileType unless ALLOWED_FILE_EXTENSIONS.include?(File.extname(model)) 
    @model = IO.readlines(model)
  end


  def extract_data
    stack = []
    facets = []

    model.each do |line|
      case line
        when /facet normal\s+(\S+)\s+(\S+)\s+(\S+)/
          stack << Triangle.new(BigDecimal.new($1),BigDecimal.new($2),BigDecimal.new($3))
        when /vertex\s+(\S+)\s+(\S+)\s+(\S+)/
          stack << Vertext.new(BigDecimal.new($1), BigDecimal.new($2), BigDecimal.new($3))
        when /endloop/
          normal, *vertices = stack.pop(4)
          facets << Facet.new(normal, *vertices)
      end
    end
    facets
  end


  def analyze
    analyzed_model = extract_data

    { number_of_triangles: analyzed_model.length,
      surface_area: SurfaceArea.calculate(analyzed_model.map(&:area)),
      bounding_box: BoundingBox.new(analyzed_model.flat_map(&:vertices)).to_a
    }
  end

end

