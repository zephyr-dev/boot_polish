require 'tree'
module BootPolish
  class TreeRenderer

    def initialize(output = nil)
      @output = output || STDOUT
      @tree = Tree::TreeNode.new("ROOT", "Root Content")
      @current_node = @tree
    end

    def descend
      new_node = Tree::TreeNode.new("node-#{@current_node.level}-#{@current_node.children.count}")
      @current_node << new_node
      @current_node = new_node
    end

    def exception(method, exception)
      @current_node.content = { method: method, exception: exception }
    end

    def benchmark method, time, opts = {}
      @current_node.content = { method: method, time: time, ephemera: opts[:ephemera] }
    end

    def ascend
      render(@current_node) if @current_node.parent.name == "ROOT"
      @current_node = @current_node.parent
    end
    private

    def render(current_node)
      result = current_node.content
      @output << "  " * (current_node.level - 1)
      if result[:exception]
        @output << "#{result[:method]} raised exception: #{result[:exception].message}"
      else
        @output << format("%.4f for #{result[:method]}  --  #{result[:ephemera]}", result[:time].real)
      end
      @output << "\n"

      current_node.children.each do |child|
        render child
      end
      @output.flush
    end

  end

end
