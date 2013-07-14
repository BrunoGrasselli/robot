class Robot
  def move(pos_x, pos_y, facing)
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
end
