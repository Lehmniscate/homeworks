class Stack
    def initialize
      @stack = []
    end

    def add(el)
      @stack.push
    end

    def remove
      @stack.pop
    end

    def show
      @stack.dup
    end
  end
