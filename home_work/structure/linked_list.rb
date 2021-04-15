class Node
  attr_accessor :next # 다음노드의 주소 값
  attr_accessor :data # 노드의 값

  def initialize(data = nil)
    @data = data
    @next = nil
  end

  def to_s
    "node: #{@data}, has_next: #{!@next.nil?}"
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
      @current = nil
      @before = nil
      self.increase_num_of_data
    else
      @head = nil
      @tail = nil
      @current = nil
      @before = nil
      @num_of_data = 0
    end
  end

  def append(data)
    if data
      # puts self.inspect
      if @head
        node = Node.new(data)
        @tail.next = node
        @tail = node
        @num_of_data += 1
      else
        @head = Node.new(data)
        @tail = @head
        @num_of_data = 1
      end
    end
  end

  def delete(data)
    @current = @head
    @before = nil
    if @current
      flag = false
      loop do
        if @current.data == data
          if @before
            @before.next = @current.next
          else
            @head = @current.next
          end
          @current = nil
          break
        else
          if @current.next
            @before = @current
            @current = @current.next
          else
            break
          end
        end
      end
      flag
    else
      -1
    end
  end

  def print_all
    node = @head
    puts '--------------------start---------------------'
    puts "head: #{@head.to_s}, tail: #{@tail.to_s}, num_of_data: #{@num_of_data}"
    loop do
      puts node.to_s
      if node.next
        node = node.next
      else
        break
      end
    end
    puts '--------------------end---------------------'
  end

  private
  def increase_num_of_data
    @num_of_data += 1
  end

  def decrease_num_of_data
    @num_of_data -= 1
  end
end



ll = LinkedList.new
ll.append(1)
ll.append(2)
ll.append(3)
ll.append(4)
ll.print_all
ll.delete(2)
ll.delete(4)
ll.print_all

