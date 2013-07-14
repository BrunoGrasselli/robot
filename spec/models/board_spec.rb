require 'spec_helper'

describe Board do
  let(:board) { described_class.new }

  describe "#place" do
    before do
      board.place 0,0,:NORTH
    end

    context "when position is valid" do
      it "returns true" do
        board.place(1,3,:SOUTH).should eq true
      end
      
      it "updates the robot position" do
        board.place(4,4,:EAST)
        board.report.should eq [4,4,:EAST]
      end
    end

    context "when position is invalid" do
      it "returns false" do
        board.place(-1,3,:SOUTH).should eq false
      end

      it "doesn't update the robot position" do
        board.place(4,5,:EAST)
        board.report.should eq [0,0,:NORTH]
      end
    end
  end
end

