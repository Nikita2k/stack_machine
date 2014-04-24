module StackMachine

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


end

