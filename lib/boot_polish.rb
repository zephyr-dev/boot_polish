require 'boot_polish/nested_benchmark'
require 'boot_polish/default_renderer'

module BootPolish
  def self.require_benchmark
    @require_benchmark ||= NestedBenchmark.new
  end
end

def require(file)
  BootPolish.require_benchmark.nest "require #{file}" do
    super
  end
end


