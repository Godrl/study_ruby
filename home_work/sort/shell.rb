def shell_sort(array)
  len = array.length
  # 간격 초기화
  gap = (len / 3) + 1

  # 간격이 1보다 작을때 까지 반복
  while gap >= 1
    for i in (gap...len)
      j = i
      # gap 만큼 떨어진 곳에 값이 없을 때 까지 반복
      while j >= gap
        # 앞에 있는 값이 더 크면
        if array[j - gap] > array[j]
          array[j], array[j - gap] = array[j - gap], array[j]
        end
        j -= gap
      end
    end
    # 간격 초기화
    gap /= 3
  end
  puts "셸 정렬 결과: #{array.inspect}"
end


arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57, 30, 80]
shell_sort(arr)
