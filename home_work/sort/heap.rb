def heap_sort(array)
  len = array.length - 1
  arr = array

  (len / 2).downto(0) do |i|
    heapify(arr, i, len)
  end

  while len > 0
    arr[0], arr[len] = arr[len], arr[0] # 가장 큰 값이 배열 첫번째 있으므로 바꿔준다.
    len -= 1 # 가장 큰 값은 이미 정렬되었으므로 정렬할 배열의 숫자 -1
    heapify(arr, 0, len)
  end
end

def heapify(arr, parent, limit)
  root = arr[parent]

  while (child = (2 * parent) + 1) <= limit do # 왼쪽 자식노드부터 검사
    if limit >= child + 1
      if child < limit && arr[child] < arr[child + 1]
        child += 1 # 오른쪽 자식노드
      end
    end
    break if root >= arr[child]
    arr[parent], parent = arr[child], child # 자식노드가 자식노드를 갖고 있으면 그 자식노드에 대해 다시 검사를 해야하므로 값뿐만 아니라 index도 바꿔준다.
  end
  arr[parent] = root
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57, 33]
heap_sort(arr)
