class Board
  LIMIT = 4

  def place(*position)
    return false unless valid_position?(position)
    self.current_position = position
    true
  end

  def report
    @current_position || [nil,nil,nil]
  end

  private

  def valid_position?(position)
    return false unless position
    (0..LIMIT).include?(position[0]) && (0..LIMIT).include?(position[1])
  end

  def current_position=(current_position)
    @current_position = current_position
  end
end
