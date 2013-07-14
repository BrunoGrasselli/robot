class GameController
  attr_accessor :board, :robot

  def initialize(robot, board)
    self.board = board
    self.robot = robot
  end

  def play(command)
    if command.match /^PLACE (\d+),(\d+),(NORTH|EAST|WEST|SOUTH)$/
      board.place $1.to_i, $2.to_i, $3.to_sym
    elsif command == "MOVE"
      board.place(*robot.move(*board.report))
    elsif command == "LEFT"
      board.place(*robot.left(*board.report))
    elsif command == "RIGHT"
      board.place(*robot.right(*board.report))
    end
  end
end
