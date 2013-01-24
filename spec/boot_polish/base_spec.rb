require 'spec_helper'
require 'boot_polish/base'

module BootPolish 
  describe Base do
    describe ".require_benchmark" do
      it "is memoized" do
        BootPolish::Base.require_benchmark.should === BootPolish::Base.require_benchmark
      end
    end
  end
end
