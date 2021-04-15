def insertion_sort(array)
  # 두번 째 값부터 반복
  for i in 1...(array.length)
    j = i
    while j > 0
      #  이전 값이 더 크면
      if array[j - 1] > array[j]
        # 교환
        array[j], array[j - 1] = array[j - 1], array[j]
      else
        # 이전 값이 더 작으면 종료
        break
      end
      # 바로 전 값을 비교해줘야 하므로 1씩 감소시킨다.
      j -= 1
    end
  end
  puts "삽입 정렬 결과: #{array.inspect}"
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57]
insertion_sort(arr)
