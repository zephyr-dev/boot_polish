require 'spec_helper'
require 'boot_polish'

# A word on this test suite:
# Because boot_polish.rb overrides 'require' you have to expect it to be
# called frequently, hence the common ".any_number_of_times" in these tests

describe BootPolish do
  describe ".require_benchmark" do
    it "is memoized" do
      BootPolish.require_benchmark.should === BootPolish.require_benchmark
    end
  end
end

describe "adding benchmarking aspects" do
  describe ".require" do
    it "benchmarks the require using require_benchmark.nest" do
      benchmark = double(:benchmark)

      benchmark.should_receive(:nest).
        with("require fixtures/dummy.rb").
        and_yield()

      benchmark.should_receive(:nest).
        any_number_of_times.
        with(anything).
        and_yield()


      BootPolish.should_receive(:require_benchmark).
        any_number_of_times.
        and_return(benchmark)

      require('fixtures/dummy.rb').should be_true 
    end

  end

end
