def selection_sort(array)
  len = array.length
  # 맨 처음 값 부터 반복
  for i in 0...len
    # i와 비교해야 하므로 i+1 부터 반복
    for j in (i + 1)...len
      # 기준 값이 더 크면
      if array[j] < array[i]
        # 교환
        array[j], array[i] = array[i], array[j]
      end
    end
  end
  puts "선택 정렬 결과: #{array.inspect}"

end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57]
selection_sort(arr)

