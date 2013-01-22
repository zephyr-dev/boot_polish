require 'benchmark'

module BootPolish
  class NestedBenchmark

    def initialize(visitor)
      @visitor = visitor
    end

    def nest method, &block
      result = nil

      @visitor.descend

      time_to_run = Benchmark.measure do
        result = yield
      end

      @visitor.ascend
      @visitor.benchmark(method, time_to_run)

      result
    end

  end
end
