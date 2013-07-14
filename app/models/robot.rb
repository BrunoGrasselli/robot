class Robot
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

    case facing
    when :NORTH
      facing = :WEST
    when :WEST
      facing = :SOUTH
    when :SOUTH
      facing = :EAST
    when :EAST
      facing = :NORTH
    end

    [pos_x, pos_y, facing]
  end

  def right(pos_x, pos_y, facing)
    return nil unless pos_x

    case facing
    when :NORTH
      facing = :EAST
    when :WEST
      facing = :NORTH
    when :SOUTH
      facing = :WEST
    when :EAST
      facing = :SOUTH
    end

    [pos_x, pos_y, facing]
  end
end
