class Node
  attr_accessor :data
  attr_accessor :left # 왼쪽 자식노드
  attr_accessor :right # 오른쪽 자식노드

  def initialize (data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(data = nil)
    @root = Node.new(data ? data : nil)
  end

  def insert(data)
    current_node = @root
    flag = false

    loop do
      if current_node.data.nil?
        current_node.data = data
        flag = true
      else
        if current_node.data > data
          if current_node.left.nil?
            current_node.left = Node.new(data)
            flag = true
          else
            current_node = current_node.left
          end
        elsif current_node.data < data
          if current_node.right.nil?
            current_node.right = Node.new(data)
            flag = true
          else
            current_node = current_node.right
          end
        else
          current_node = nil
        end
      end

      break if current_node.nil? || flag
    end

    flag
  end

  def search(data)
    current_node = @root
    find_node = nil

    loop do
      break unless current_node.nil? or find_node.nil?
      if current_node.data == data
        find_node = current_node
      elsif current_node.data > data
        current_node = current_node.left
      elsif current_node.data < data
        current_node = current_node.right
      else
        break
      end
    end

    find_node.data
  end

  # 숙제
  def delete(data)
    current = @root
    parent = nil

    loop do
      break if !parent.nil? && current.data == data
      parent = @root if current.data == data
      if data < current.data
        current = current.left
      elsif data > current.data
        current = current.right
      end
      if current.right
        if current.right.data == data
          parent = current
          current = current.right
          break
        end
      elsif current.left
        if current.left.data == data
          parent = current
          current = current.left
          break
        end
      end
    end

    if parent.right == current
      if current.left.nil? && current.right.nil?
        parent.right = nil
      elsif current.left.nil? && current.right
        parent.right = current.right
      elsif current.left && current.right.nil?
        parent.right = current.left
      else
        loop do
          temp = current
          current = current.right if current.right
          unless current.left || current.right
            parent.right = current
            current.left = temp.left
            current.right = temp.right
            break
          end
          if current.left && current.right.nil?
            current = current.left
          end
        end
      end
    elsif parent.left == current
      if current.left.nil? && current.right.nil?
        parent.left = nil
      elsif current.left.nil? && current.right
        parent.left = current.right
      elsif current.left && current.right.nil?
        parent.left = current.left
      else
        loop do
          temp = current
          current = current.left if current.left
          unless current.left || current.right
            parent.left = current
            current.left = temp.left
            current.right = temp.right
            break
          end
          if current.left.nil? && current.right
            current = current.right
          end
        end
      end
    end
  end
end

def validate(node)
  return true if node.nil?

  flag = if node.left and node.right
           node.data > node.left.data and node.data < node.right.data
         elsif node.left
           node.data > node.left.data
         elsif node.right
           node.data < node.right.data
         else
           false
         end

  flag and validate(node.left) and validate(node.right)
end


bi_tree = BinaryTree.new

bi_tree.insert 100
bi_tree.insert 20
bi_tree.insert 10
bi_tree.insert 40
bi_tree.insert 30
bi_tree.insert 50
bi_tree.insert 70
bi_tree.insert 60
bi_tree.insert 110
bi_tree.insert 120
bi_tree.insert 140
bi_tree.insert 130
bi_tree.insert 160
bi_tree.insert 150

puts bi_tree.search 50
bi_tree.delete 140
bi_tree.validate @root
puts bi_tree.search 140
