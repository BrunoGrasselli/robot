require 'spec_helper'

describe Robot do
  let(:robot) { described_class.new }
  describe "#move" do
    it "moves to north when robot is facing north" do
      robot.move(1,1,:NORTH).should eq [1,2,:NORTH]
    end

    it "moves to south when robot is facing south" do
      robot.move(2,3,:SOUTH).should eq [2,2,:SOUTH]
    end

    it "moves to west when robot is facing west" do
      robot.move(2,3,:WEST).should eq [1,3,:WEST]
    end
    
    it "moves to east when robot is facing east" do
      robot.move(2,3,:EAST).should eq [3,3,:EAST]
    end
  end
end

