def quick_sort(array, left = 0, right = array.length - 1)
  if left < right
    part = partition(array, left, right) # part = pivot 인덱스
    quick_sort(array, left, part - 1) # pivot 왼쪽
    quick_sort(array, part + 1, right) # pivot 오른쪽
  end
  puts "퀵 정렬 결과: #{array.inspect}"
end

# 전체배열에서 일부분만 정렬하는 함수
def partition(array, left, right)
  left_index = left
  right_index = right + 1
  mid = (left + right) / 2
  swap(array, left ,mid)
  pivot = array[left] # pivot = 각 배열 중간 값
  loop do
    # 왼쪽부터 pivot 보다 큰 값이 있는지 검사
    loop do
      left_index += 1
      break if array[left_index] > pivot || left_index >= right
    end
    # 오른쪽부터 pivot 보다 작은 값이 있는지 검사
    loop do
      right_index -= 1
      break if array[right_index] < pivot || right_index <= left
    end
    break if left_index >= right_index
    swap(array, left_index, right_index) # 찾은 left_index 위치의 값과 right 위치의 값을 바꾼다
  end
  swap(array, left, right_index) # 왼쪽 인덱스 값이 오른쪽 인덱스 값보다 클 때 pivot 값과 오른쪽 인덱스 위치에 있는 값과 바꾼다
  right_index # pivot 인덱스 반환
end

def swap(array, i, j)
  array[i], array[j] = array[j], array[i]
end

arr = [5, 3, 15, 8, 4, 10, 9, 1, 6, 2, 13, 7]
quick_sort(arr)
