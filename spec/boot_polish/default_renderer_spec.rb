require "spec_helper"
require "boot_polish/default_renderer"

module BootPolish
  describe DefaultRenderer do
    describe "instance" do

      let(:output) { double(:output) }
      let(:time) { double(:time, real: 9.99) }
      let(:renderer) { DefaultRenderer.new(output) }

      describe "#benchmark" do
        it "outputs the method and real time" do
          output.should_receive(:<<).with(/(footle)+/)

          renderer.descend
          renderer.benchmark("footle", time)
          renderer.ascend
        end

        it "allows for further annotation from the caller" do
          output.should_receive(:<<).with(/(other)+/)

          renderer.descend
          renderer.benchmark("footle", time, ephemera: "Something other")
          renderer.ascend
        end
      end

      describe "#exception" do
        it "outputs the method and the error" do
          output.should_receive(:<<).with(/(footle)+.*(dootle)+/)

          renderer.descend
          renderer.exception("footle", Exception.new("dootle"))
          renderer.ascend
        end
      end

      describe "#ascend and #descend" do
        it "indents two spaces for each descend after the first" do
          output.should_receive(:<<).with(/footle/).ordered
          output.should_receive(:<<).with(/^  .*wankle/).ordered
          output.should_receive(:<<).with(/spittle/).ordered

          renderer.descend
          renderer.benchmark("footle", time)
          renderer.descend
          renderer.benchmark("wankle", time)
          renderer.ascend
          renderer.ascend

          renderer.descend
          renderer.benchmark("spittle", time)
          renderer.ascend
        end

      end
    end
  end
end

