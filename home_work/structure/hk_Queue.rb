class Node
  attr_accessor :next # 다음노드의 주소 값
  attr_reader   :data # 노드의 값

  def initialize (data)
    @data = data
    @next = nil
  end

  def to_s
    "Node: #{@data}"
  end
end

class Queue
  @front
  @rear
  @count

  def initialize
    @front = nil
    @rear = nil
    @count = 0
  end

  def push (data)
    if @front
      @count += 1
      rear.next = Node.new(data)
      @rear = rear
    else
      @count += 1
      @front = Node.new(data)
      @rear = @front
    end
  end

  def rear
    node = @front

    return node unless node.next
    return node unless node.next while (node = node.next)
  end

  def pop
    if @front
      @count -= 1

      temp = @front
      @front = @front.next
      temp
    else
      "No Node"
    end

  end

  def peek
    if @front == nil
      "No Node"
    else
      @front
    end
  end

  def is_empty
    @front ? "Not Empty" : "This Queue is Empty"
  end

  def size
    @count
  end
end

q = Queue.new

puts q.is_Empty
puts q.peek
q.push 5
q.push 6
q.push 3

puts q.is_Empty
puts "peek #{q.peek}" # 5
puts q.inspect # 5 6 3
puts "pop #{q.pop}" # 5
puts q.inspect # 6 3

puts "Queue size: #{q.size}"
