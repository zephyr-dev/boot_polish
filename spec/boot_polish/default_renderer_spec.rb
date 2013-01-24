require "spec_helper"
require "boot_polish/default_renderer"

module BootPolish
  describe DefaultRenderer do
    describe "instance" do
      describe "#benchmark" do
        let(:output) { double(:output) }
        let(:time) { double(:time, real: 9.99) }
        let(:renderer) { DefaultRenderer.new(output) }

        it "outputs the method and real time" do
          output.should_receive(:<<).with(/(footle)+/)
          renderer.descend
          renderer.benchmark("footle", time)
        end

        it "indents two spaces for each descend after the first" do
          output.should_receive(:<<).with(/^\w+/).ordered
          output.should_receive(:<<).with(/^  \w+/).ordered

          renderer.descend
          renderer.benchmark("footle", time)
          renderer.descend
          renderer.benchmark("footle", time)
        end

        it "outdents two spaces for each ascend" do
          output.should_receive(:<<).with(/^  \w+/).ordered
          output.should_receive(:<<).with(/^\w+/).ordered

          renderer.descend
          renderer.descend
          renderer.benchmark("footle", time)
          renderer.ascend
          renderer.benchmark("footle", time)
        end
      end
    end
  end
end

