class Robot
  FACES = [:NORTH, :WEST, :SOUTH, :EAST]

  def move(pos_x, pos_y, facing)
    return nil unless pos_x

    case facing
    when :NORTH
      pos_y += 1
    when :SOUTH
      pos_y -= 1
    when :WEST
      pos_x -= 1
    when :EAST
      pos_x += 1
    end

    [pos_x, pos_y, facing]
  end

  def left(pos_x, pos_y, facing)
    return nil unless pos_x

    facing = (FACES * 2)[FACES.index(facing) + 1]

    [pos_x, pos_y, facing]
  end

  def right(pos_x, pos_y, facing)
    return nil unless pos_x

    facing = FACES[FACES.index(facing) - 1]

    [pos_x, pos_y, facing]
  end
end
