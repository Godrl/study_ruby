def bubble_sort (array)
  len = array.length - 1
  loop do
    flag = false
    # array.length - 1 만큼 반복
    len.times do |i|
      #  다음값보다 크면
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        flag = true
      end
    end
    # 교환 할 값이 없으면 하나의 값이 최종위치에 놓이므로 길이를 줄이고 종료
    unless flag
      len -= 1
      break
    end
  end
  puts "버블 정렬 결과: #{array.inspect}"
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57]
bubble_sort(arr)
