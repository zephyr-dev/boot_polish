require "spec_helper"
require "boot_polish/nested_benchmark"

module BootPolish
  describe NestedBenchmark do

    describe "instance" do

      let(:visitor) { double(:visitor, benchmark: nil, descend: nil, ascend: nil) }
      let(:nested_benchmark) { NestedBenchmark.new( visitor ) }

      describe "#nest" do
        it "returns the blocks evaluated value" do
          nested_benchmark.nest("holas") do
            77
          end.should == 77
        end
      end

      it "visits and yields in the correct order" do
        block_content = double(:block_content)

        visitor.should_receive(:descend).ordered
        block_content.should_receive(:yield!).ordered
        visitor.should_receive(:ascend).ordered
        visitor.should_receive(:benchmark).with("Hi", kind_of(Benchmark::Tms)).ordered

        nested_benchmark.nest("Hi") do
          block_content.yield!
        end
      end
    end
  end
end
