class BoundingBox

  attr_reader :vertices
  attr_accessor :x_values, :y_values, :z_values

  def initialize(vertices)
    @vertices = vertices
    @x_values = []
    @y_values = []
    @z_values = []
    assign_values
  end

  def assign_values
    vertices.each do |vertext|
      x_values << vertext.x.to_f
      y_values << vertext.y.to_f
      z_values << vertext.z.to_f
    end
  end

  def to_a
    [
      {x: x_values.min, y: y_values.min, z: z_values.min},
      {x: x_values.max, y: y_values.max, z: z_values.max},
    ]
  end

end
