module BootPolish
  class DefaultRenderer

    def initialize(output = nil)
      @output = output || STDOUT
      @indent = -1
    end

    def descend
      @indent += 1
    end

    def exception(method, exception)
      @output << "#{indent}#{method} raised #{exception.message}\n"
    end

    def benchmark method, time
      @output << format("#{indent}%.4f for #{method}\n", time.real)
    end

    def ascend
      @indent -= 1
    end

    private

    def indent
      "  " * @indent
    end

  end

end
