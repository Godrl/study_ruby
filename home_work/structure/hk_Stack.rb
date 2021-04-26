class Stack

  # 초기화
  def initialize
    @stack = []
  end

  # 데이터 삽입(아래부터 차곡차곡 삽입)
  def add(data)
    @stack.push data
  end

  # 맨 위 데이터 확인(변화 없음)
  def peek
    puts "stack peek = #{@stack.last}"
  end

  # 맨 위 데이터를 꺼내서 확인 후 삭제(데이터 삭제됨)
  def pop
    puts  "stack pop = #{@stack.pop}"
  end

  # 비어 있는지 확인(비어 있으면 true / 데이터 있으면 false)
  def is_Empty
    puts  "stack isEmpty = #{@stack.empty?}"
  end
end


s = Stack.new

s.add(5)
s.add(6)
s.add(7)
puts  s.inspect # inspect ==> 내부 값 확인 [5, 6, 7]

s.peek # 7

s.pop # 7

puts  s.inspect # [5, 6]

s.is_Empty


