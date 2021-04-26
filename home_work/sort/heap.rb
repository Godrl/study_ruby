def heap_sort(array)
  len = array.length - 1
  arr = array

  (len / 2).downto(0) do |i|
    heapify(arr, i, len)
  end

  puts arr.inspect
  while len > 0
    arr[0], arr[len] = arr[len], arr[0]
    len -= 1
    heapify(arr, 0, len)
  end
  puts array.inspect
end

def heapify(arr, parent, limit)
  root = arr[parent]

  while (child = 2 * parent) <= limit do
    if arr[child + 1].present?
      if child < limit && arr[child] < arr[child + 1]
        child += 1
      end
    end
    break if root >= arr[child]
    arr[parent], parent = arr[child], child
  end
  arr[parent] = root
end

arr = [1, 5, 10, 13, 20, 15, 100, 24, 90, 57, 33]
heap_sort(arr)
