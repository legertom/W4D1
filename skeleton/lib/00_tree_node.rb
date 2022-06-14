module Searchable

    def dfs(target = nil, &prc)
        prc ||= Proc.new { |node| node.value == target }
        return self if prc.call(self)
        children.each do |child|  
          result = child.dfs(&prc)
          return result unless result.nil?
        end
        nil
    end

    def bfs(target = nil, &prc)
        prc ||= Proc.new { |node| node.value == target }
        # return self if prc.call(self)

        nodes = [self]
        until nodes.empty?
            node = nodes.shift
            return node if prc.call(node)
            nodes.concat(node.children)

        end
        nil

    end


end

class PolyTreeNode
include Searchable

    attr_reader :value, :parent, :children
    attr_writer :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        @parent = new_parent
        if !@parent.nil? && !@parent.children.include?(self)
            @parent.children << self
        end
    end

    def add_child(child)
        child.parent=(self)
    end

    def remove_child(child)
        if self.children.include?(child)
            child.parent=(nil)
        else
            raise 'Error this node is not a child'
        end
    end


    

end

