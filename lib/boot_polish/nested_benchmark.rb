require 'benchmark'

module BootPolish
  class NestedBenchmark

    attr_accessor :visitor

    def initialize(visitor = nil)
      @visitor = visitor || DefaultRenderer.new
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
