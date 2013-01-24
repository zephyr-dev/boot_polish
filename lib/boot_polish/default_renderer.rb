module BootPolish
  class DefaultRenderer

    def initialize(output = nil)
      @output = output || STDOUT
      @level = -1
    end

    def descend
      @level += 1
    end

    def ascend
      @level -= 1
    end

    def benchmark method, time
      @output << "#{indent}#{method} in #{time.real}\n"
    end

    private

    def indent
      "  " * @level
    end

  end
end
