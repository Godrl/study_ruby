class Node
  attr_accessor :data
  attr_accessor :left # 왼쪽 자식노드
  attr_accessor :right # 오른쪽 자식노드

  def initialize (data)
    @data = data
    @left = nil
    @right = nil
  end

  def to_s
    puts "Node: #{@data} left: #{@left.data} right: #{@right.data}"
  end
end

class BinaryTree
  def initialize(data = nil)
    if data
      @root = Node.new(data)
      @left = @root.left
      @right = @root.right
    else
      @root = nil
      @left = nil
      @right = nil
    end
  end

  def insert(data)
    if @root
      current = @root # 루트노드 or 부모노드

      while current != nil # current가 nil이 될 때 까지 실행
        if (data < current.data) && (current.left == nil)
          current.left = Node.new(data) # root.left에 node추가
        elsif  (data > current.data) && (current.right == nil)
          current.right = Node.new(data)
        elsif (data < current.data)
          current = current.left # current node를 왼쪽으로 이동시키고 다시 while조건문으로 돌아가서 적정한 위치를 찾는다
        elsif (data > current.data)
          current = current.right
        else
          return
        end
      end
    else
      @root = Node.new(data)
    end

  end


  def search(data)
    current = @root
    return current if data == current.data

    if data > current.data
      current = current.right
      return current if current.data == data
    elsif data < current.data
      current = current.left
      return current if current.data == data
    else
      return
    end
  end

  def delete(data)
    current = @root
    return current if current.nil?

    if data < @root.data
      current = current.left
      if current.data == data
        if current.left.nil? && current.right.nil?
          current = nil
        elsif current.left.nil? && current.right != nil
          current = current.right
        elsif current.left != nil && current.right.nil?
          current = current.left
        else

        end
      end
    else
      current = current.right
      if current.data == data
        if current.left.nil? && current.right.nil?
          current = nil
        elsif current.left.nil? && current.right != nil
          current = current.right
        elsif current.left != nil && current.right.nil?
          current = current.left
        else

        end
      end
    end
  end

  def validate (current = @root)
    return if current == nil
    validate(current.left)
    puts current.data
    validate(current.right)
  end
end

bi_tree = BinaryTree.new

bi_tree.insert 50
bi_tree.insert 25
bi_tree.insert 75
bi_tree.insert 15
bi_tree.insert 30
bi_tree.insert 60
bi_tree.insert 88
bi_tree.insert 100

puts "Search #{bi_tree.search 75}"
bi_tree.delete 100
bi_tree.validate



