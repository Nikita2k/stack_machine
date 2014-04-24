require "./helper"

module StackMachine
  include Helper

  MAX_ITEM = 4095 # 2^14= 4096 (unsigned)

  class Stack
    def initialize
      @stack = []
    end

    def pop
      @stack.pop
    end

    def push(n)
      @stack.push(n)
    end

    def count
      @stack.size
    end

    def empty?
      count == 0
    end
  end


  def self.stack_machine_emulator(s)
    return -1 unless s
    return -1 unless (0..1000000).include?(s.size)
    return -1 unless s.kind_of?(String)

    input = s.split('')
    stack = Stack.new

    input.each do |char|

      if numeric? char
        stack.push(char.to_i)

      elsif op? char        
        v1 = stack.pop unless stack.empty?
        v2 = stack.pop unless stack.empty?

        if v1&&v2

          if char == "*"
            res = v1.to_i*v2.to_i
          elsif char == "+"
            res = v1.to_i+v2.to_i
          end

          return -1  if (res > MAX_ITEM)
          
          stack.push(res)
              
        else
          return -1
        end

      else
        return -1
      end          
    end

    (stack.count == 1) ? (stack.pop) : (return -1)
  end

end

