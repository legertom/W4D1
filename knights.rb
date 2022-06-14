class KnightPathFinder

    POSSIBLE_MOVES = (
        [1,2],
        [2,1],
        [-1,2],
        [-2,1],
        [1,-2],
        [2,-1]
    )
    def initialize(start_pos)
        @start_pos = pos
        self.root_node = PolyTreeNode.new(pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    def build_move_tree(start_pos)
        self.root_node = [start_pos]
        moves = @considered_positions
        until moves.empty?
            move = moves.shift
            self.root_node << PolyTreeSort.add_child(move)
            moves.concat(move.children)
        end

    end

    def valid_moves(start_pos)
        valid_moves = []
            POSSIBLE_MOVES.each do |move|
                new_move =  [move[0]+start[0], move[1]+start[1]]
                valid_moves << new_move if new_move.all? {|pos| pos.between?(0..7)}
            end
            valid_moves
    end

    def new_move_positions(pos)
        @considered_positions << valid_moves.select { |move| !@considered_positions.include?(move)}
    end

    def find_path(end_pos)
        self.root_node.children.each do |child|
            return child if child.position == end_pos
        end
        nil

    end

    def trace_path_back
        end_node = find_path(target)
        path = []
        until end_node.parent == start_pos
          path << end_node.parent
        end
        path
    end

end