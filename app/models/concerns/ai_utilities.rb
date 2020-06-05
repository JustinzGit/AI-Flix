module AiUtilities

  class Node
    attr_accessor :state, :parent, :action

    def initialize(state, parent, action)
      @state = state
      @parent = parent
      @action = action
    end
  end

end
