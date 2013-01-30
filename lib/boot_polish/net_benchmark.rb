require 'benchmark'
require 'net/http'

module BootPolish
  class NetBenchmark

    attr_accessor :visitor

    def initialize(visitor = nil)
      @visitor = visitor || DefaultRenderer.new
      alias_http_start
    end

    private
    
    def alias_http_start
      Http::Net.rt
    end

  end
end

