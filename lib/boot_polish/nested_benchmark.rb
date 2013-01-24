require 'benchmark'

module BootPolish
  class NestedBenchmark

    attr_accessor :visitor

    def initialize(visitor = nil)
      @visitor = visitor || DefaultRenderer.new
    end

    def nest method, &block
      result = nil

      before_call

      time_to_run = Benchmark.measure do
        begin
          result = yield
        rescue Exception => e
          after_call(method, nil, e)
          raise e
        end
      end

      after_call(method, time_to_run)

      result
    end

    private
    
    def before_call 
      @visitor.descend
    end

    def after_call(method, time_to_run, exception = nil)
      if exception
        @visitor.exception(method, exception)
      else
        @visitor.benchmark(method, time_to_run)
      end

      @visitor.ascend
    end

  end
end
