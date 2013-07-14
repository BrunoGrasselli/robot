class GameController
  attr_accessor :board, :robot, :output

  def initialize(robot, board, output=STDOUT)
    self.board = board
    self.robot = robot
    self.output = output
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
    elsif command == "REPORT"
      if board.report.first.nil?
        output.puts "ROBOT ISN'T PLACED"
      else
        output.puts "ROBOT POSITION: #{board.report.join(', ')}"
      end
    else
      output.puts "UNKNOWN COMMAND"
    end
  end
end
