require 'spec_helper'
require 'boot_polish'

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


      BootPolish::Base.should_receive(:require_benchmark).
        any_number_of_times.
        and_return(benchmark)

      require('fixtures/dummy.rb').should be_true
    end

  end
end
