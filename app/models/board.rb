class Board
  LIMIT = 4

  def place(*position)
    return false unless position
    pos_x, pos_y, facing = position
    return false unless valid_position?(pos_x, pos_y)
    self.current_position = pos_x, pos_y, facing
    true
  end

  def report
    @current_position || [nil,nil,nil]
  end

  private

  def valid_position?(pos_x, pos_y)
    (0..LIMIT).include?(pos_x) && (0..LIMIT).include?(pos_y)
  end

  def current_position=(current_position)
    @current_position = current_position
  end
end
