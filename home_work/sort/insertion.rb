def insertion_sort(array)
  for i in 1...(array.length)
    j = i
    while j > 0
      if array[j - 1] > array[j]
        array[j], array[j - 1] = array[j - 1], array[j]
      else
        break # 이전 값이 더 작으면 종료
      end
      j -= 1 # 바로 전 값을 비교해줘야 하므로 1씩 감소시킨다.
    end
  end
  puts "삽입 정렬 결과: #{array.inspect}"
end

arr = [1, 10, 5, 13, 20, 15, 100, 24, 57, 90]
insertion_sort(arr)
