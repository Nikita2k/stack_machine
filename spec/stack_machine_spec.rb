require 'spec_helper'
require "./stack_machine"

describe StackMachine do

  it "With string '13+62*7+*' should return 76" do
  	input = "13+62*7+*"
  	sub   = StackMachine.stack_machine_emulator(input)
  	expect(sub).to eq(76)
  end    

  it "should return error if the input is '11++' " do
  	input = "11++"
  	sub   = StackMachine.stack_machine_emulator(input)
  	expect(sub).to eq(-1)
  end 

  it "With string 43+32552+**** should return 1470" do
  	input = "43+32552+****"
  	sub   = StackMachine.stack_machine_emulator(input)
  	expect(sub).to eq(1470)
  end 

  it "With string 43+02550+**** should return 0" do
  	input = "43+02550+****"
  	sub   = StackMachine.stack_machine_emulator(input)
  	expect(sub).to eq(0)
  end 

  it "With only numbers given should get an error" do  	  	
  	sub   = StackMachine.stack_machine_emulator("12345678")
  	expect(sub).to eq(-1)
  end

  it "With only operators given should get an error" do  	  	
  	sub   = StackMachine.stack_machine_emulator("++++******")
  	expect(sub).to eq(-1)
  end

  it "With only one type of operators should get an error" do  	  	
  	sub   = StackMachine.stack_machine_emulator("************")
  	expect(sub).to eq(-1)
  end

  it "with string 000000++++* given should get a zero" do  	  	
  	sub   = StackMachine.stack_machine_emulator("000000++++*")
  	expect(sub).to eq(0)
  end

  it "should get an error with buffer overflow" do  	  	
  	sub   = StackMachine.stack_machine_emulator("999999*****")
  	expect(sub).to eq(-1)
  end

  it "should get an error with string larger than the max size" do  	  	
  	large_num = ""
  	1000001.times{ large_num << rand(10).to_s}
  	sub   = StackMachine.stack_machine_emulator(large_num)
  	expect(sub).to eq(-1)
  end  

  it "should get an error with unsupported operators" do  	  	
  	sub   = StackMachine.stack_machine_emulator("9999-99*****")
  	expect(sub).to eq(-1)
  end

  it "should get an error with non string input" do  	  	
  	sub   = StackMachine.stack_machine_emulator(123344)
  	expect(sub).to eq(-1)
  end

  it "should get an error with buffer overflow with 0" do  	  	
  	sub   = StackMachine.stack_machine_emulator("990099999**+*****")
  	expect(sub).to eq(-1)
  end  

  it "should get an error with unsupported characters (number first)" do  	  	
  	sub   = StackMachine.stack_machine_emulator("21..//18f19hf832f3")
  	expect(sub).to eq(-1)
  end  

  it "should get an error with unsupported characters (operator first)" do  	  	
  	sub   = StackMachine.stack_machine_emulator("++..//1?f1'9hf832f3")
  	expect(sub).to eq(-1)
  end  

  it "should get an error with nil" do  	  	
  	sub   = StackMachine.stack_machine_emulator(nil)
  	expect(sub).to eq(-1)
  end  

   it "should get an error with empty spaces" do  	  	
  	sub   = StackMachine.stack_machine_emulator("   ")
  	expect(sub).to eq(-1)
  end 
  
end

