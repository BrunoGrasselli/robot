require 'spec_helper'

describe GameController do
  describe "#play" do
    let(:board)      { Board.new }
    let(:robot)      { Robot.new }
    let(:output)     { StringIO.new }
    let(:controller) { described_class.new(robot, board, output) }

    context "robot is placed" do
      before do
        board.place(0,0,:NORTH)
      end

      context "when command is PLACE" do
        it "places the robot on the new place if place is valid" do
          controller.play("PLACE 3,1,NORTH")
          board.report.should eq [3,1,:NORTH]
        end

        it "keeps the robot on the previous place if place is invalid" do
          controller.play("PLACE 10,1,NORTH")
          board.report.should eq [0,0,:NORTH]
        end
      end

      context "when command is MOVE" do
        it "places the robot on the new place if movement is valid" do
          controller.play("MOVE")
          board.report.should eq [0,1,:NORTH]
        end

        it "keeps the robot on the previous place if movement is invalid" do
          board.place(0,4,:NORTH)
          controller.play("MOVE")
          board.report.should eq [0,4,:NORTH]
        end
      end

      context "when command is LEFT" do
        it "turns the robot" do
          controller.play("LEFT")
          board.report.should eq [0,0,:WEST]
        end
      end

      context "when command is RIGHT" do
        it "turns the robot" do
          controller.play("RIGHT")
          board.report.should eq [0,0,:EAST]
        end
      end

      context "when command is REPORT" do
        it "keeps the robot on the previous place if movement is invalid" do
          controller.play("REPORT")
          board.report.should eq [0,0,:NORTH]
        end

        it "outputs the robot position" do
          controller.play("REPORT")
          output.seek(0)
          output.read.should eq "ROBOT POSITION: 0, 0, NORTH\n"
        end
      end
    end

    context "robot isn't placed" do
      context "when command is PLACE" do
        it "places the robot on the new place if place is valid" do
          controller.play("PLACE 3,1,NORTH")
          board.report.should eq [3,1,:NORTH]
        end

        it "do nothing" do
          controller.play("PLACE 10,1,NORTH")
          board.report.should eq [nil,nil,nil]
        end
      end

      context "when command is MOVE" do
        it "do nothing" do
          controller.play("MOVE")
          board.report.should eq [nil,nil,nil]
        end
      end

      context "when command is LEFT" do
        it "do nothing" do
          controller.play("LEFT")
          board.report.should eq [nil,nil,nil]
        end
      end

      context "when command is RIGHT" do
        it "do nothing" do
          controller.play("RIGHT")
          board.report.should eq [nil,nil,nil]
        end
      end

      context "when command is REPORT" do
        it "outputs the robot position" do
          controller.play("REPORT")
          output.seek(0)
          output.read.should eq "ROBOT ISN'T PLACED\n"
        end
      end
    end

    context "when command is unknown" do
      it "outputs a message" do
        controller.play("A COMMAND")
        output.seek(0)
        output.read.should eq "UNKNOWN COMMAND\n"
      end
    end
  end
end

