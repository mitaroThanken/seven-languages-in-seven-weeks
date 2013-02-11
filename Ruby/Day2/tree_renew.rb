# coding: utf-8

class Tree
  attr_accessor :children, :node_name

# 同一シンボルのメソッドは複数定義できない。あと勝ち。
#  def initialize(name, children=[])
#    @children = children
#    @node_name = name
#  end

  def initialize(seed, *option)
    if (seed.class <= Hash) && (option.length == 0) 
      # ハッシュで初期化するパターン
      node = seed.flatten

      if node.length != 2
        # fix me 名前と子の組みじゃない
      else
        if node[1].class <= Hash
          @children = node[1].collect {|child| Tree.new(Hash[*child]) }
          @node_name = node[0]
        elsif node[1].class <= Array
          @children = node[1]
          @node_name = node[0]
        else
          # fix me 葉がハッシュでも配列でもない
        end
      end

    elsif ( (seed.class <= Hash) != true ) && (option.length <= 1)
      # ノードの名前と配列で初期化するパターン
      children = option.flatten

      if children.class == Array
        @children = children
        @node_name = seed
      else
        # fix me 想定外の引数
      end
    else
      # fix me 想定外の引数
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

puts "ハッシュで初期化するパターン"
tree = Tree.new( {'grandpa' => { 'dad' => { 'child 1' => [], 'child 2' => [] }, 'uncle' => { 'child 3' => [], 'child 4' => [] } } } )

puts "Visiting a node"
tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
tree.visit_all {|node| puts node.node_name}
puts

puts "配列で初期化するパターン"
ruby_tree = Tree.new( "Ruby",
  [ Tree.new("Reia"),
    Tree.new("MacRuby") ] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

