# odin-recursion
Implements two recursive algorithms with `ruby` for: 
1. $n^{th}$ fibonnaci sequence, and
2. sorting an array of numbers using the merge sort approach.

### Fibbonacci Numbers
A fibbonaci sequence is one comprised of fibbonaci numbers where $f(n) = f(n-1) + f(n-2)$ for $n > 2$, e.g.:

$f(1) f(2) f(3) f(4) f(5) f(6) f(7) f(8)$

$0,   1,   1,   2,   3,   5,   8,   13...$

Non-recursive Form
```ruby
def fibs(num, result = [0, 1])
  (2..num - 1).each { |i| result << result[i - 1] + result[i - 2] }
  result
end
```

Recursive Form
```ruby
def fibs_rec(num)
  return [0] if num <= 1
  return [0, 1] if num == 2

  result = fibs_rec(num - 1)
  result << result[-2] + result[-1]
end
```

### Merge Sort
The algorithm works by using a divide and conquer approach. Given an array, the array is sub-divided repeatedly into halves until each sub-array is precisely one element. 

The algorithm can be imagined as a branching tree, whose tips are merged as individual sub-arrays are compared and sorted into larger sub-arrays.

![Merge Sort Example](.assets/merge-sort.png)


```ruby
def merge_sort(arr)
  return unless arr.length > 1

  mid = arr.length / 2

  left = arr[0..mid - 1]
  right = arr[mid..]

  # p mid, left, right

  merge_sort(left)
  merge_sort(right)

  merge(arr, left, right)

  # p arr
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
```
