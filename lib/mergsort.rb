def merge_sort(arr)
  return unless arr.length > 1

  mid = arr.length / 2

  left = arr[0..mid - 1]
  right = arr[mid..]

  merge_sort(left)
  merge_sort(right)

  merge(arr, left, right)
end

def merge(arr, left, right)
  i = j = k = 0

  while i < left.length && j < right.length
    if left[i] < right[j]
      arr[k] = left[i]
      i += 1
    else
      arr[k] = right[j]
      j += 1
    end
    k += 1
  end

  while i < left.length
    arr[k] = left[i]
    i += 1
    k += 1
  end

  while j < right.length
    arr[k] = right[j]
    j += 1
    k += 1
  end
  arr
end

arr = [5, -5, 9, 1, 6, 3, 2, -2, 0, 11, 67, 13, 13, 1]
p merge_sort(arr) # => [-5, -2, 0, 1, 1, 2, 3, 5, 6, 9, 11, 13, 13, 67]
