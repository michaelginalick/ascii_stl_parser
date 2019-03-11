class Facet


  attr_reader :normal, :vertices
  attr_accessor(
    :length_between_vertices_0_and_1,
    :length_between_vertices_0_and_2,
    :length_between_vertices_1_and_2
  )

  def initialize(normal, *vertices)
    @normal = normal
    @vertices = vertices
  end


  def area
    calculated_perimeter = perimeter / 2.0

    Math.sqrt(calculated_perimeter * 
      (calculated_perimeter-length_between_vertices_0_and_1) * 
      (calculated_perimeter-length_between_vertices_0_and_2) * 
      (calculated_perimeter-length_between_vertices_1_and_2)
    )
  end


  private

  def length_between_vertices_0_and_1
   @length_between_vertices_0_and_1 ||= Math.sqrt(
      ((vertices[0].x - vertices[1].x)**2) +
      ((vertices[0].y - vertices[1].y)**2) +
      ((vertices[0].z - vertices[1].z)**2)
    )
  end
  
  def length_between_vertices_0_and_2
    @length_between_vertices_0_and_2 ||= Math.sqrt(
      ((vertices[0].x - vertices[2].x)**2) +
      ((vertices[0].y - vertices[2].y)**2) +
      ((vertices[0].z - vertices[2].z)**2)
    )
  end

  def length_between_vertices_1_and_2
    @length_between_vertices_1_and_2 ||= Math.sqrt(
      ((vertices[1].x - vertices[2].x)**2) +
      ((vertices[1].y - vertices[2].y)**2) +
      ((vertices[1].z - vertices[2].z)**2)
    )
  end

  def perimeter
    length_between_vertices_0_and_1 + 
    length_between_vertices_0_and_2 + 
    length_between_vertices_1_and_2
  end

end
