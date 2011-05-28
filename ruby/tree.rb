
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children={})
    @node_name = name
    @children = []

    children.each do |key, value|
      @children << Tree.new(key, value)
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end

end

tree = Tree.new('Family', {'grandpa' => {
                            'dad' => {
                              'child 1' => {},
                              'child 2' => {}
                            }, 
                            'uncle' => {
                              'child 3' => {},
                              'child 4' => {} 
                            }
                          }
})
tree.visit_all {|node| puts node.node_name }
