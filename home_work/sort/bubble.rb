def bubble_sort(array)
  loop do
    flag = false
    # array.length 만큼 반복
    (array.length - 1).times do |i|
      #  다음값보다 크면
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        flag = true
      end
    end
    # 교환 할 값이 없으면 종료
    break unless flag
  end
  puts "버블 정렬 결과: #{array.inspect}"
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57]
bubble_sort(arr)
