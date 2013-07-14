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

    it "returns nil when robot isn't placed anywhere" do
      robot.move(nil,nil,nil).should eq nil
    end
  end

  describe "#left" do
    it "turns to west when robot is facing north" do
      robot.left(1,1,:NORTH).should eq [1,1,:WEST]
    end

    it "turns to south when robot is facing west" do
      robot.left(2,3,:WEST).should eq [2,3,:SOUTH]
    end

    it "turns to east when robot is facing south" do
      robot.left(2,3,:SOUTH).should eq [2,3,:EAST]
    end
    
    it "turns to north when robot is facing east" do
      robot.left(2,3,:EAST).should eq [2,3,:NORTH]
    end

    it "returns nil when robot isn't placed anywhere" do
      robot.left(nil,nil,nil).should eq nil
    end
  end

  describe "#right" do
    it "turns to east when robot is facing north" do
      robot.right(1,1,:NORTH).should eq [1,1,:EAST]
    end

    it "turns to south when robot is facing east" do
      robot.right(2,3,:EAST).should eq [2,3,:SOUTH]
    end

    it "turns to west when robot is facing south" do
      robot.right(2,3,:SOUTH).should eq [2,3,:WEST]
    end
    
    it "turns to north when robot is facing west" do
      robot.right(2,3,:WEST).should eq [2,3,:NORTH]
    end

    it "returns nil when robot isn't placed anywhere" do
      robot.right(nil,nil,nil).should eq nil
    end
  end
end

