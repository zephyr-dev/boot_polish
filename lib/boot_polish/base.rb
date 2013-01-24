require 'boot_polish/nested_benchmark'

module BootPolish 
  class Base
    def self.require_benchmark
      @require_benchmark ||= NestedBenchmark.new
    end
  end
end
