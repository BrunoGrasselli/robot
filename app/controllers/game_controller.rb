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
    elsif ["MOVE","LEFT","RIGHT"].include? command
      board.place(*robot.send(command.downcase, *board.report))
    elsif command == "REPORT"
      report
    else
      output.puts "UNKNOWN COMMAND"
    end
  end

  private

  def report
    if board.report == [nil,nil,nil]
      output.puts "ROBOT ISN'T PLACED"
    else
      output.puts "ROBOT POSITION: #{board.report.join(', ')}"
    end
  end
end
