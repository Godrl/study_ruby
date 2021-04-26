class Node
  attr_accessor :next # 다음노드의 주소 값
  attr_reader   :data # 노드의 값

  def initialize(data)
    @data = data
    @next  = nil
  end

  def to_s
    "Node: #{@data}"
  end
end

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :current
  attr_accessor :before
  attr_accessor :num_of_data

  def initialize(data = nil)
    if data
      @head = Node.new(data)
      @tail = @head
      @current = @head
      @before = nil
      @num_of_data = 1
    end
  end

  def append(data)
    if @head
      node = Node.new(data)
      @tail.next = node
      @tail = node
      @num_of_data += 1
    else
      @head = Node.new(data)
      @tail = @head
      @num_of_data += 1
    end
  end

  def delete(data)
    @current = @head
    if @current
      loop do
        if @current.data == data # 지금 데이터가 지우려는 데이터이면
          if @before
            @before.next = @current.next
          else
            @current = @current.next
          end
        else # 지금 데이터가 지우려는 데이터가 아니면
          if @current.next

          end
        end
      end

    else
      puts "No Node"
    end
  end

  def first

  end

  def next

  end

  def size
    @num_of_data
  end

end

