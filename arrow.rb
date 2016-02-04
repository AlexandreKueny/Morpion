class Arrow

  def initialize(angle, pos, image)
    @angle = angle
    @pos = pos
    @def_pos = Marshal.dump(pos)
    @image = image
  end

  def move
    if @angle == 0
      @pos[:x] += 2
      if @pos[:x] > Marshal.load(@def_pos)[:x] + 10
        @pos = Marshal.load(@def_pos)
      end
    elsif @angle == -90
      @pos[:y] -= 2
      if @pos[:y] < Marshal.load(@def_pos)[:y] - 10
        @pos = Marshal.load(@def_pos)
      end
    elsif @angle == 90
      @pos[:y] += 2
      if @pos[:y] > Marshal.load(@def_pos)[:y] + 10
        @pos = Marshal.load(@def_pos)
      end
    end
  end

  def draw
    @image.draw_rot(@pos[:x], @pos[:y], 0, @angle, 0.6, 0.5, 0.05, 0.05)
  end
end