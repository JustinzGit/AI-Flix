module AiUtilities

  class Node
    attr_accessor :state, :parent, :action
    def initialize(state, parent, action)
      @state = state
      @parent = parent
      @action = action
    end
  end

  class QueueFronteir
    @@fronteir = []

    def add(node)
      @@fronteir << node
    end

    def contains_state(state)
      @@fronteir.any? {|node| node.state == state}
    end

    def empty?
      @@fronteir.empty?
    end

    def remove
      if self.empty?
        raise IndexError, "Empty Fronteir"
      else
        node = @@fronteir.shift
        return node
      end
    end
  end
end
