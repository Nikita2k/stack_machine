require 'spec_helper'
require "./stack_machine"

describe StackMachine do
	
  it "with string 13+62*7+* given" do
    StackMachine.stack_machine_emulator(
        "13+62*7+*").should eq(76)    
  end    
end

