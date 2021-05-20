def shell_sort(array)
  len = array.length
  gap = get_gap(len)

  # 간격이 1보다 작을때 까지 반복
  while gap >= 1
    for i in (gap...len)
      j = i
      # gap 만큼 떨어진 곳에 값이 없을 때 까지 반복
      while j >= gap
        if array[j - gap] > array[j]
          array[j], array[j - gap] = array[j - gap], array[j]
        end
        j -= gap
      end
    end
    gap = get_gap(gap)
  end
  puts "셸 정렬 결과: #{array.inspect}"
end

def get_gap(gap)
  gap /= 3
  gap += 1 if gap > 1 && gap.even?
  gap
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57, 30, 80]
shell_sort(arr)
